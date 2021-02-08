const cityModel = require('../models/cities')

exports.listCities = async (req, res) => {
    const results = await cityModel.listCities()
    return res.json({
        success: true,
        message: 'List Cities',
        results
    })
}

exports.getCityById = async (req, res) => {
  const { id } = req.params
  const results = await cityModel.getCityById(id)
  if (results.length > 0) {
    return res.json({
      success: true,
      message: 'Details of City',
      results
    })
  }
  return res.status(400).json({
    success: false,
    message: 'City not exists'
  })
}