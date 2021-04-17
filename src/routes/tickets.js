const routes = require('express').Router()
const ticketController = require('../controllers/tickets')
const authorization = require('../middlewares/auth')

routes.post('/', ticketController.buySeat)
routes.post('/payment', ticketController.paymentMethod)
routes.get('/', ticketController.getSeat)
routes.get('/ticket-history', authorization.authCheck, ticketController.getTicketHistory)
routes.post('/ticket-history', authorization.authCheck, ticketController.makeTicketHistory)

module.exports = routes