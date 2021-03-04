const routes = require('express').Router()
const authController = require('../controllers/auth')
const authorization = require('../middlewares/auth')

routes.post('/login', authController.login)
routes.post('/register', authController.register)
routes.patch('/update-profile/', authorization.authCheck, authController.updateUserDetails)

module.exports = routes