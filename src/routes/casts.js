const routes = require('express').Router()
const castController = require('../controllers/casts')

routes.get('/', castController.getAllCasts)
routes.get('/:id', castController.getCastsById)
routes.post('/', castController.createCasts)
routes.delete('/:id', castController.deleteCasts)
routes.put('/:id', castController.updateCasts)

module.exports = routes