const moviesController = require('../controllers/movies')
const routes = require('express').Router()

routes.get('/', moviesController.listMovies)
routes.post('/', moviesController.newMovies)
routes.get('/:id', moviesController.detailMovies)
routes.get('/genre/:name', moviesController.genreMovies)
routes.delete('/:id', moviesController.deleteMovie)
// routes.put('/:id', moviesController.putMovie)

module.exports = routes