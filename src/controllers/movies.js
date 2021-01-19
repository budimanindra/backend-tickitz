const { LIMIT_DATA, APP_URL } = process.env
const movieModel = require('../models/movies')

exports.createMovies = (req, res) => {
    const data = req.body
    movieModel.createMovies(data, (results) => {
        return res.json({
            success: true,
            message: 'Movie created successfully',
            results
            })
        })
    }