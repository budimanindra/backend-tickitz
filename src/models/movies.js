const db = require('../helpers/db')

exports.createMovies = (data = {}, cb) => {
    db.query(`
    INSERT INTO movies
    (${Object.keys(data).join()})
    VALUES
    (${Object.values(data).map(item => `"${item}"`).join(',')})
    `, (err, res, field) => {
        if (err) throw err
        console.log(field)
        cb(res)
    })
}   