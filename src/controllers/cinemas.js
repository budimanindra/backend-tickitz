exports.listCinemas = (request, response) => {
    const data = require('../helpers/listCinemas')
    // const paging = (page * limit) - limit
    // const { page = 1, limit=LIMIT_DATA} = req.query
    // const results = data.slice(page-1, limit)
    // const offset = limit * page
    return response.json({
        success: true,
        message: 'List of Cinemas',
        data
    })
}

exports.detailCinemas = (request, response) => {
    const data = require('../helpers/listCinemas')
    for (let index = 0; index < data.length; index++) {
        if (Number(request.params.id) === data[index].id) {
            return response.json({
                success: true,
                message: 'List of Cinemas',
                results: data[index]
            })
        }
    }

    return response.status(404).json({
        success: false,
        message: 'Cinema not found'
    })
}

exports.newCinemas = (request, response) => {
    const data = require('../helpers/listCinemas')
    const { id, name, location } = request.body
    // request.body.id = Number(id)
    const newObject = {
        id: Number(id),
        name: name,
        location: location
    }
    data.push(newObject)
    return response.json({
        success: true,
        message: 'New cinemas added',
        data
    })
}

exports.deleteCinemas = (request, response) => {
    const data = require('../helpers/listCinemas')
    for (let index = 0; index < data.length; index++) {
        if (Number(request.params.id) === data[index].id) {
            data.splice((request.params.id-1), 1)
            return response.json({
                success: true,
                message: 'Cinema deleted',
                results: data
            })
        }
    }
}