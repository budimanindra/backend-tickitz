const db = require('../helpers/db')

exports.listCities = () => {
    return new Promise((resolve, reject) => {
        const query = db.query(`
        SELECT * FROM cities
    `,(err, res, field) => {
            if (err) reject(err)
            resolve(res)
        })
        console.log(query.sql)
    })
}

exports.getCityById = (id) => {
    return new Promise((resolve, reject) => {
        const query = db.query(`
        SELECT *
        FROM cities
        WHERE id=${id}
        `,
        (err, res, field) => {
            if (err) reject(err)
            resolve(res)
        })
        console.log(query.sql)
    })
}