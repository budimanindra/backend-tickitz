const routes = require('express').Router()
const genreController = require('../controllers/genres')

routes.get('/', genreController.getAllGenre)
routes.get('/:id', genreController.getGenreById)
routes.post('/', genreController.createGenre)
routes.delete('/:id', genreController.deleteGenre)
routes.put('/:id', genreController.updateGenre)

module.exports = routes