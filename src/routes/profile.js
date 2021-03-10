const routes = require('express').Router()
const profileController = require('../controllers/profile')
const authorization = require('../middlewares/auth')

routes.patch('/update-profile-details', authorization.authCheck, profileController.updateUserDetails)
routes.patch('/update-profile-photo', authorization.authCheck, profileController.updatePhoto)

module.exports = routes