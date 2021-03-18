const movieModel = require('../models/movies')
const genreModel = require('../models/genres')
const movieGenreModel = require('../models/movieGenres')
const multer = require('multer')
const upload = require('../helpers/upload').single('image')
const response = require('../helpers/response')

exports.getMoviesById = async (req, res) => {
  const { id } = req.params
  const results = await movieModel.getMovieById(id)
  if (results.length > 0) {
    const arr = results.reduce((accumulator, item, _index, source)=> {
      const keys = Object.keys(source[0])
      const multiData = ['genreName', 'castName']
      keys.forEach(key=>{
          if(multiData.indexOf(key)===-1) accumulator[key] = item[key]
      })
      multiData.forEach(col => {
          accumulator[col] = accumulator[col] || [];
          if(accumulator[col].indexOf(item[col])===-1) accumulator[col].push(item[col])
      })
      return accumulator
    },{})

    final_results = {
          id: arr.id,
          name: arr.name,
          image: arr.image,
          releaseDate: arr.releaseDate,
          endDate: arr.endDate,
          duration: arr.duration,
          directedBy: arr.directedBy,
          synopsis: arr.synopsis,
          genreName: arr.genreName.join(', '),
          castName: arr.castName.join(', ')
        }
    return response(res, 200, true, 'Details of Movie', final_results)
  }
  return response(res, 400, false, 'Failed to get movie details')
}

exports.deleteMovieById = (req, res) => {
  const id = req.params.id
  movieModel.deleteMovieById(id, (results) => {
    if (results.affectedRows > 0) {
      return res.json({
        success: true,
        message: 'Movies deleted successfully',
      })
    }
    return res.status(404).json({
      success: false,
      message: 'Failed to delete Movies'
    })
  })
}

exports.updateMovieById = (req, res) => {
  const { id } = req.params
  const data = req.body
  movieModel.getMovieById(id, initialResult => {
    if (initialResult.length > 0) {
      movieModel.updateMovieById(id, data, results => {
        return res.json({
          success: true,
          message: 'Update movies success',
          results: {
            ...initialResult[0],
            ...data
          }
        })
      })
    } else {
      return res.status(404).json({
        success: false,
        message: 'Failed to update movies'
      })
    }
  })
}



// 

// list movies with pagination
exports.listMovies = (req, res) => {
  const cond = req.query
  cond.search = cond.search || ''
  cond.page = Number(cond.page) || 1
  cond.limit = Number(cond.limit) || 5
  cond.dataLimit = cond.limit * cond.page
  cond.offset = (cond.page - 1) * cond.limit
  cond.sort = cond.sort || 'id'
  cond.order = cond.order || 'ASC'

  movieModel.getMoviesByCondition(cond, results => {
    return res.json({
      success: true,
      message: 'List of all Movies',
      results
    })
  })
}

// create movie with relation between genres and movies
exports.createMovie = (req, res) => {
  upload(req, res, async err => {
    const data = req.body
    console.log(data)
    const selectedGenre = []
    if (err instanceof multer.MulterError) {
      return res.json({
        success: false,
        message: 'Error uploading file'
      })
    } else if (err) {
      return res.json({
        success: false,
        message: 'Error uploading file'
      })
    }
    if (typeof data.idGenre === 'object') {
      const results = await genreModel.checkGenresAsync(data.idGenre)
      if (results.length !== data.idGenre.length) {
        return res.json({
          success: false,
          message: 'Some genre are unavailable'
        })
      } else {
        results.forEach(item => {
          selectedGenre.push(item.id)
        })
      }
    } else if (typeof data.idGenre === 'string') {
      const results = await genreModel.checkGenresAsync([data.idGenre])
      if (results.length !== data.idGenre.length) {
        return res.json({
          success: false,
          message: 'Some genre are unavailable'
        })
      } else {
        results.forEach(item => {
          selectedGenre.push(item.id)
        })
      }
    }
    console.log(data)
    const movieData = {
      name: data.name,
      image: (req.file && req.file.path) || data.image,
      releaseDate: data.releaseDate,
      endDate: data.endDate,
      duration: data.duration,
      directedBy: data.directedBy,
      synopsis: data.synopsis
    }
    const initialResult = await movieModel.createMoviesAsync(movieData)
    if (initialResult.affectedRows > 0) {
      if (selectedGenre.length > 0) {
        await movieGenreModel.createBulkMovieGenres(initialResult.insertId, selectedGenre)
      }
      const movies = await movieModel.getMovieByIdWithGenreAsync(initialResult.insertId)
      if (movies.length > 0) {
        return res.json({
          success: true,
          message: 'Movie successfully created',
          results: {
            id: movies[0].id,
            name: movies[0].name,
            image: movies[0].image,
            releaseDate: movies[0].releaseDate,
            endDate: movies[0].endDate,
            duration: movies[0].duration,
            directedBy: movies[0].directedBy,
            synopsis: movies[0].synopsis,
            genres: movies.map(item => item.genreName)
          }
        })
      } else {
        return res.status(400).json({
          success: false,
          message: 'Failed to create Movie'
        })
      }
    }
  })
}


exports.getMoviesNowShowing = async (req, res) => {
  const results = await movieModel.getMoviesNowShowing()
  if (results.length > 0) {
    const listMovie = []
    const genres = {}
    results.forEach(item => {
      if(!(`${item.id}` in genres)) {
        genres[`${item.id}`] = [item.genreName]
        listMovie.push({
          id: item.id,
          name: item.name,
          image: item.image,
          releaseDate: item.releaseDate,
          genreName: genres[`${item.id}`]
        })
      } else {
        genres[`${item.id}`].push(item.genreName)
      }
    });

    listMovie.map(item => {
      item.genreName = item.genreName.join(', ')
    })

    return res.json({
      success: true,
      message: 'Details of Now Showing Movies',
      results: listMovie
    })
  }
  return res.status(400).json({
    success: false,
    message: 'Movies not exists'
  })
}

exports.getUpcomingMovies = async (req, res) => {
  const results = await movieModel.getUpcomingMovies()
  if (results.length > 0) {
    const listMovie = []
    const genres = {}
    results.forEach(item => {
      if(!(`${item.id}` in genres)) {
        genres[`${item.id}`] = [item.genreName]
        listMovie.push({
          id: item.id,
          name: item.name,
          image: item.image,
          releaseDate: item.releaseDate,
          genreName: genres[`${item.id}`]
        })
      } else {
        genres[`${item.id}`].push(item.genreName)
      }
    });

    listMovie.map(item => {
      item.genreName = item.genreName.join(', ')
    })

    return res.json({
      success: true,
      message: 'Details of Upcoming Movies',
      results: listMovie
    })
  }
  return res.status(400).json({
    success: false,
    message: 'Movies not exists'
  })
}