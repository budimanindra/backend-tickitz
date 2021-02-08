const userModel = require('../models/users')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { APP_KEY } = process.env
const resp = require('../helpers/response')

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