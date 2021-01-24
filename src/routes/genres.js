const routes = require('express').Router()
const genreController = require('../controllers/genres')

routes.get('/', genreController.getAllGenre)
routes.get('/:id', genreController.getGenreById)

module.exports = routes