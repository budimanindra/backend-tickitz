const routes = require('express').Router()
const ticketController = require('../controllers/tickets')

routes.post('/', ticketController.buySeat)
routes.post('/payment', ticketController.paymentMethod)
routes.get('/', ticketController.getSeat)

module.exports = routes