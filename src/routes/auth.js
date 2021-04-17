const routes = require('express').Router()
const authController = require('../controllers/auth')
const validator = require('../middlewares/auth')

routes.post('/login', authController.login)
routes.post('/register', validator.isFieldsEmpty,
validator.isFieldsLength, validator.isFieldsLegalChars, authController.register)

module.exports = routes