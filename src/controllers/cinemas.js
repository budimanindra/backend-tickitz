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
    cinemasModel.getCinemaById(id, (results) => {
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
    cinemasModel.createCinema(data, (results) => {
        if (results.affectedRows > 0) {
            cinemasModel.getCinemaById(results.insertId, (finalResult) => {
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

exports.getAllCinemasByMovieIdAsync = async (req, res) => {
    const {id,city,date} = req.query
    const cinemas = await cinemasModel.getAllCinemasByMovieIdAsync(id,city,date)

    if (cinemas.length > 0) {
        const listCinema = []
        const showTimes = {}
        const idShowtimes = {}
        cinemas.forEach(item => {
          if(!(`${item.id}` in showTimes)) {
            showTimes[`${item.id}`] = [item.showTimes]
            idShowtimes[`${item.id}`] = [item.idShowtime]
            listCinema.push({
              id: item.id,
              name: item.name,
              image: item.image,
              address: item.address,
              priceWeekdays: item.priceWeekdays,
              priceWeekend: item.priceWeekend,
              idShowtime: idShowtimes[`${item.id}`],
              showTimes: showTimes[`${item.id}`]
            })
          } else {
            showTimes[`${item.id}`].push(item.showTimes)
            idShowtimes[`${item.id}`].push(item.idShowtime)
          }
        });
    
        return res.json({
          success: true,
          message: 'Cinemas showtimes in the city',
          results: listCinema
        })
      }
    return res.json({
      success: false,
      message: 'cinemas list',
      results: []
    })
  }