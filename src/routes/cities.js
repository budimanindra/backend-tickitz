const routes = require('express').Router()
const cityController = require('../controllers/cities')

routes.get('/', cityController.listCities)
routes.get('/:id', cityController.getCityById)

module.exports = routes