const cinemasModel = require('../models/cinemas')

exports.getAllCinemas = (req, res) => {
    const data = req.body
    cinemasModel.getAllCinemas((results) => {
        return res.json({
            success: true,
            message: 'List Cinemas',
            results
        })
    })
}

exports.getCinemasById = (req, res) => {
    const id = req.params.id
    cinemasModel.getCinemasById(id, (results) => {
        if (results.length > 0) {
            return res.json({
                success: true,
                message: 'Detail of cinemas',
                results: results[0]
            })            
        }
        else {
            return res.status(404).json({
                success: false,
                message: 'Failed to get detail of Cinemas'
            })
        }
    })
}

exports.createCinemas = (req, res) => {
    const data = req.body
    cinemasModel.createCinemas(data, (results) => {
        if (results.affectedRows > 0) {
            cinemasModel.getCinemasById(results.insertId, (finalResult) => {
                if (finalResult.length > 0) {
                    return res.status(201).json({
                        success: true,
                        message: 'Details of Cinemas',
                        results: finalResult[0]
                    })
                }
                return res.status(400).json({
                    success: false,
                    message: 'Failed to create Cinemas'
                })
            })
        }
    })
}

exports.deleteCinemas = (req, res) => {
    const id = req.params.id
    cinemasModel.deleteCinemas(id, (results) => {
        if (results.affectedRows > 0) {
            return res.json({
                success: true,
                message: 'Cinemas deleted successfully',
            })
        }
        return res.status(404).json({
            success: false,
            message: 'Failed to delete Cinemas'
        })
    })
}

exports.updateCinemas = (req, res) => {
    const { id } = req.params
    const data = req.body
    cinemasModel.getCinemasById(id, initialResult => {
        if (initialResult.length > 0) {
            cinemasModel.updateCinemas(id, data, results => {
                return res.json({
                    success: true,
                    message: 'Update cinemas success',
                    results: {
                        ...initialResult[0],
                        ...data
                    }
                })
            })
        } else {
            return res.status(404).json({
                success: false,
                message: 'Failed to update cinemas'
            })
        }
    })
}