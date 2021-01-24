const routes = require('express').Router()
const authController = require ('../controllers/auth')

routes.post('/login', authController.login)

module.exports = routes