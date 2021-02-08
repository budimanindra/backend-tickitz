exports.userAlreadyExist = (res) => {
    return res.status(400).json({
        success: false,
        message: 'Registered failed, email already exist'
    })
}