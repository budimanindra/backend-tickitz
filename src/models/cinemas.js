const db = require('../helpers/db')

exports.getAllCinemas = (cb) => {
    const query = db.query(`
    SELECT * FROM cinemas
  `, (err, res, field) => {
        if (err) throw err
        // console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.getCinemasById = (id, cb) => {
    const query = db.query(`
    SELECT * FROM cinemas WHERE id=${id}
  `, (err, res, field) => {
        if (err) throw err
        // console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.createCinemas = (data = {}, cb) => {
    const query = db.query(`
  INSERT INTO cinemas
  (${Object.keys(data).join()})
  VALUES
  (${Object.values(data).map(item => `"${item}"`).join(',')})
  `, (err, res, field) => {
        if (err) throw err
        console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.deleteCinemas = (id, cb) => {
    const query = db.query(`
  DELETE FROM cinemas
  WHERE id = ${id}
  `, (err, res, field) => {
        if (err) throw err
        console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.updateCinemas = (id, data, cb) => {
    const key = Object.keys(data)
    const value = Object.values(data)
    const query = db.query(`
    UPDATE cinemas
    SET ${key.map((item, index) => `${item}="${value[index]}"`)}
    WHERE id=${id}
  `, (err, res, field) => {
        if (err) throw err
        cb(res)
    })
    console.log(query.sql)
}