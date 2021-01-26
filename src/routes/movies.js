const routes = require('express').Router()
const movieController = require('../controllers/movies')

routes.get('/', movieController.listMovies)
routes.get('/now-showing', movieController.getMoviesNowShowing)
routes.get('/upcoming-movies', movieController.getMoviesUpcoming)
routes.get('/:id', movieController.getMoviesById)

module.exports = routes