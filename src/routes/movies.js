const routes = require('express').Router()
const movieController = require('../controllers/movies')

routes.get('/', movieController.listMovies)
routes.get('/:id', movieController.getMoviesById)

module.exports = routes