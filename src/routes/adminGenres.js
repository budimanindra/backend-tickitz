const genreController = require('../controllers/genres')
const routes = require('express').Router()

routes.get('/', genreController.listGenres)
routes.get('/:id', genreController.getGenreById)
routes.post('/', genreController.createGenre)
routes.delete('/:id', genreController.deleteGenre)
routes.put('/:id', genreController.updateGenre)

module.exports = routes