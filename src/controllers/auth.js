exports.login = (req, res) => {
    const {username, password} = req.body
    return res.json({
        success: true,
        message: 'Login successfully',
        token: '1234'
    })
}

const userModel = require('../models/users')

exports.login = async (req, res) => {
    const {username, password} = req.body
    const users = await userModel.getUsersByConditionAsync
}