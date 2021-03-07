const userModel = require('../models/users')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { APP_KEY } = process.env
const response = require('../helpers/response')

exports.login = async (req, res) => {
  const { email, password } = req.body
  const existingUser = await userModel.getUsersByConditionAsync({ email })
  if (existingUser.length > 0) {
    const compare = await bcrypt.compare(password, existingUser[0].password)
    if (compare) {
      const { id } = existingUser[0]
      const token = jwt.sign({ id }, APP_KEY)
      return res.json({
        success: true,
        message: 'Login successfully',
        token
      })
    }
  }
  return res.status(401).json({
    success: false,
    message: 'Wrong email or password'
  })
}

exports.register = async (req, res) => {
  const { email, password } = req.body
  const isExists = await userModel.getUsersByConditionAsync({ email })
  if (isExists.length < 1) {
    const salt = await bcrypt.genSalt()
    const encryptedPassword = await bcrypt.hash(password, salt)
    const createUser = await userModel.createUserAsync({ email, password: encryptedPassword })
    if (createUser.insertId > 0) {
      const { insertId } = createUser
      const token = jwt.sign({ insertId }, APP_KEY)
      return res.json({
        success: true,
        message: 'Register success!',
        token
      })
    } else {
      return res.status(400).json({
        success: false,
        message: 'Register Failed'
      })
    }
  } else {
    return res.status(400).json({
      success: false,
      message: 'Register Failed, email already exists'
    })
  }
}

exports.updateUserDetails = async (req, res) => {
  
  var {id} = req.userData   
  
  const {
    email, password, fullName, phoneNumber
  } = req.body

  try {
    const row = await userModel.getUsersByIdAsync( id )
    const user = row[0]
    if (!user) {
      return response(res, 400, false, 'Failed to edit profile, unknown user id')
    } else {
      const salt = await bcrypt.genSalt()
    const encryptedPassword = await bcrypt.hash(password, salt)
      const editedUser = {
        ...user,
        email: email ? email : user.email,
        password: password ? encryptedPassword : user.password,
        fullName: fullName ? fullName : user.fullName,
        phoneNumber: phoneNumber ? phoneNumber : user.phoneNumber
      }
      try {
        const updateProfile = await userModel.updateUserDetails(editedUser, id)
        if (!updateProfile) {
          return response(res, 400, false, 'Failed to edit profile')
        } else {
          return response(res, 200, true, 'Successfully to edit profile', {
            ...editedUser,
            password: 'secret'
          })
        }
      } catch (err) {
        return response(res, 500, false, 'Failed to edit profile, server error')
      }
    }
  } catch (err) {
    return response(res, 500, false, 'Failed to edit profile, server error')
  }
}

exports.updateUserDetails = async (req, res) => {
  
  var {id} = req.userData   
  console.log(id)
  
  const {
    photo
  } = req.body

  try {
    const row = await userModel.getUsersByIdAsync( id )
    const user = row[0]
    if (!user) {
      return response(res, 400, false, 'Failed to edit profile, unknown user id')
    } else {
      try {
        const updateProfile = await userModel.updateUserDetails(editedUser, id)
        if (!updateProfile) {
          return response(res, 400, false, 'Failed to edit profile')
        } else {
          return response(res, 200, true, 'Successfully to edit profile', {
            ...editedUser,
            password: 'secret'
          })
        }
      } catch (err) {
        return response(res, 500, false, 'Failed to edit profile, server error')
      }
    }
  } catch (err) {
    return response(res, 500, false, 'Failed to edit profile, server error')
  }
}