const routes = require('express').Router()
const cinemaController = require('../controllers/cinemas')

routes.get('/', cinemaController.getAllCinemasByMovieIdAsync)
// routes.get('/', cinemaController.getAllCinemas)
routes.get('/:id', cinemaController.getCinemasById)
routes.post('/', cinemaController.createCinemas)
routes.delete('/:id', cinemaController.deleteCinemas)
routes.put('/:id', cinemaController.updateCinemas)

module.exports = routes