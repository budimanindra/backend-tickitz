const routes = require('express').Router()
const moviesController = require('../controllers/movies')


routes.post('/', moviesController.createMovies)


module.exports = routes