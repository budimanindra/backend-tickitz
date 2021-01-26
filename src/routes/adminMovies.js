const movieController = require('../controllers/movies')
const authorization = require('../middlewares/auth')
const routes = require('express').Router()

routes.get('/', movieController.listMovies)
routes.get('/:id', movieController.getMoviesById)
routes.post('/',  authorization.authCheck, movieController.createMovie)
routes.delete('/:id',  authorization.authCheck, movieController.deleteMovieById)
routes.put('/:id',  authorization.authCheck, movieController.updateMovieById)

module.exports = routes