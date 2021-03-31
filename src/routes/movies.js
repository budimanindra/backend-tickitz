const routes = require('express').Router()
const movieController = require('../controllers/movies')

routes.get('/movies', movieController.listMovies)
routes.get('/movies/now-showing', movieController.getMoviesNowShowing)
routes.get('/movies/upcoming-movies', movieController.getUpcomingMovies)
routes.get('/movies/upcoming-movies-pagination', movieController.getUpcomingMoviesPagination)
routes.get('/movies/now-showing-movies-pagination', movieController.getNowShowingMoviesPagination)
routes.get('/movies/:id', movieController.getMoviesById)

module.exports = routes