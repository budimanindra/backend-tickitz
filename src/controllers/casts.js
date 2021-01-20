const castsModel = require('../models/casts')

exports.getAllCasts = (req, res) => {
    const data = req.body
    castsModel.getAllCasts((results) => {
        return res.json({
            success: true,
            message: 'List Casts',
            results
        })
    })
}

exports.getCastsById = (req, res) => {
    const id = req.params.id
    castsModel.getCastsById(id, (results) => {
        if (results.length > 0) {
            return res.json({
                success: true,
                message: 'Detail of casts',
                results: results[0]
            })            
        }
        else {
            return res.status(404).json({
                success: false,
                message: 'Failed to get detail of Casts'
            })
        }
    })
}

exports.createCasts = (req, res) => {
    const data = req.body
    castsModel.createCasts(data, (results) => {
        if (results.affectedRows > 0) {
            castsModel.getCastsById(results.insertId, (finalResult) => {
                if (finalResult.length > 0) {
                    return res.status(201).json({
                        success: true,
                        message: 'Details of Casts',
                        results: finalResult[0]
                    })
                }
                return res.status(400).json({
                    success: false,
                    message: 'Failed to create Casts'
                })
            })
        }
    })
}

exports.deleteCasts = (req, res) => {
    const id = req.params.id
    castsModel.deleteCasts(id, (results) => {
        if (results.affectedRows > 0) {
            return res.json({
                success: true,
                message: 'Casts deleted successfully',
            })
        }
        return res.status(404).json({
            success: false,
            message: 'Failed to delete Casts'
        })
    })
}

exports.updateCasts = (req, res) => {
    const { id } = req.params
    const data = req.body
    castsModel.getCastsById(id, initialResult => {
        if (initialResult.length > 0) {
            castsModel.updateCasts(id, data, results => {
                return res.json({
                    success: true,
                    message: 'Update casts success',
                    results: {
                        ...initialResult[0],
                        ...data
                    }
                })
            })
        } else {
            return res.status(404).json({
                success: false,
                message: 'Failed to update casts'
            })
        }
    })
}