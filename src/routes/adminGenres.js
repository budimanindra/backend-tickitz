const movieController = require('../controllers/movies')
const routes = require('express').Router()

routes.get('/', movieController.listMovies)
routes.get('/:id', movieController.getMoviesById)
routes.post('/', movieController.createMovie)
routes.delete('/:id', movieController.deleteMovieById)
routes.put('/:id', movieController.updateMovieById)

module.exports = routes