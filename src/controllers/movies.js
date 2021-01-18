const { push } = require('../helpers/listCinemas')

const { LIMIT_DATA } = process.env

// menampilkan semua movie
exports.listMovies = (request, response) => {
    const data = require('../helpers/listMovies')
    return response.json({
        success: true,
        message: 'List of Movies',
        data
    })
}

// menampilkan detail dari movie yang diinginkan
exports.detailMovies = (request, response) => {
    const data = require('../helpers/listMovies')
    for (let index = 0; index < data.length; index++) {
        if (Number(request.params.id) === data[index].id) {
            return response.json({
                success: true,
                message: 'Movie details',
                results: data[index]
            })
        }
    }

    return response.status(404).json({
        success: false,
        message: 'Movie not found'
    })
}

// menampilkan movie yang se-genre
exports.genreMovies = (request, response) => {
    let moviesResults = []
    const data = require('../helpers/listMovies')
    for (let index = 0; index < data.length; index++) {
        if (data[index].genre.includes(request.params.name)) {
            moviesResults.push(data[index])
        }
    }
    return response.json({
        success: true,
        message: 'List of Movies',
        results: moviesResults
    })
}

// menambah movie baru pada list movie
exports.newMovies = (request, response) => {
    const data = require('../helpers/listMovies')
    const { id, name, genre, description, releaseYear } = request.body
    // request.body.id = Number(id)
    const newObject = {
        id: Number(id),
        name: name,
        description: description,
        genre: genre,
        releaseYear: releaseYear
    }
    data.push(newObject)
    return response.json({
        success: true,
        message: 'New cinemas added',
        data
    })
}

// delete data tertentu dari movie
exports.deleteMovie = (request, response) => {
    const data = require('../helpers/listMovies')
    for (let index = 0; index < data.length; index++) {
        if (Number(request.params.id) === data[index].id) {
            data.splice((request.params.id-1), 1)
            return response.json({
                success: true,
                message: 'Movie deleted',
                results: data
            })
        }
    }
}


// put
// exports.putMovie = (request, response) => {
//     const data = require('../helpers/listMovies')
//     for (let index = 0; index < data.length; index++) {
//         if (Number(request.body.id) === data[index].id) {
            
//             return response.json({
//                 success: true,
//                 message: 'Movie details',
//                 results: data[index]
//             })
//         }
//     }
// }
