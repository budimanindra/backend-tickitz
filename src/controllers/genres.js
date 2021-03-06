const genreModel = require('../models/genres')

// list all genre without pagination
// exports.getAllGenre = (req, res) => {
//     const data = req.body
//     genreModel.getAllGenre((results) => {
//         return res.json({
//             success: true,
//             message: 'List Genre',
//             results
//         })
//     })
// }

exports.getGenreById = (req, res) => {
    const id = req.params.id
    genreModel.getGenreById(id, (results) => {
        if (results.length > 0) {
            return res.json({
                success: true,
                message: 'Detail of genre',
                results: results[0]
            })
        }
        else {
            return res.status(404).json({
                success: false,
                message: 'Failed to get detail of Genre'
            })
        }
    })
}

exports.createGenre = (req, res) => {
    const data = req.body
    genreModel.createGenre(data, (results) => {
        if (results.affectedRows > 0) {
            genreModel.getGenreById(results.insertId, (finalResult) => {
                if (finalResult.length > 0) {
                    return res.status(201).json({
                        success: true,
                        message: 'Details of Genre',
                        results: finalResult[0]
                    })
                }
                return res.status(400).json({
                    success: false,
                    message: 'Failed to create Genre'
                })
            })
        }
    })
}

exports.deleteGenre = (req, res) => {
    const id = req.params.id
    genreModel.deleteGenre(id, (results) => {
        if (results.affectedRows > 0) {
            return res.json({
                success: true,
                message: 'Genre deleted successfully',
            })
        }
        return res.status(404).json({
            success: false,
            message: 'Failed to delete Genre'
        })
    })
}

exports.updateGenre = (req, res) => {
    const { id } = req.params
    const data = req.body
    genreModel.getGenreById(id, initialResult => {
        if (initialResult.length > 0) {
            genreModel.updateGenre(id, data, results => {
                return res.json({
                    success: true,
                    message: 'Update genre success',
                    results: {
                        ...initialResult[0],
                        ...data
                    }
                })
            })
        } else {
            return res.status(404).json({
                success: false,
                message: 'Failed to update genre'
            })
        }
    })
}



// 

// list all genre with pagination
exports.listGenres = (req, res) => {
    const cond = req.query
    cond.search = cond.search || ''
    cond.page = Number(cond.page) || 1
    cond.limit = Number(cond.limit) || 5
    cond.dataLimit = cond.limit * cond.page
    cond.offset = (cond.page - 1) * cond.limit
    cond.sort = cond.sort || 'id'
    cond.order = cond.order || 'ASC'
  
    genreModel.getGenresByCondition(cond, results => {
      return res.json({
        success: true,
        message: 'List of all Genres',
        results
      })
    })
  }