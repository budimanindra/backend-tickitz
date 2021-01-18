const cinemasController = require('../controllers/cinemas')
const routes = require('express').Router()

routes.get('/', cinemasController.listCinemas)
routes.post('/', cinemasController.newCinemas)
routes.get('/:id', cinemasController.detailCinemas)
routes.delete('/:id', cinemasController.deleteCinemas)
// routes.put('/:id', cinemasController.putCinemas)

module.exports = routes