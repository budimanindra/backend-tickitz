const db = require('../helpers/db')

exports.getAllCasts = (cb) => {
    const query = db.query(`
    SELECT * FROM casts
  `, (err, res, field) => {
        if (err) throw err
        // console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.getCastsById = (id, cb) => {
    const query = db.query(`
    SELECT * FROM casts WHERE id=${id}
  `, (err, res, field) => {
        if (err) throw err
        // console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.createCasts = (data = {}, cb) => {
    const query = db.query(`
  INSERT INTO casts
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

exports.deleteCasts = (id, cb) => {
    const query = db.query(`
  DELETE FROM casts
  WHERE id = ${id}
  `, (err, res, field) => {
        if (err) throw err
        console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.updateCasts = (id, data, cb) => {
    const key = Object.keys(data)
    const value = Object.values(data)
    const query = db.query(`
    UPDATE casts
    SET ${key.map((item, index) => `${item}="${value[index]}"`)}
    WHERE id=${id}
  `, (err, res, field) => {
        if (err) throw err
        cb(res)
    })
    console.log(query.sql)
}

// key = [id, name, apalahitu]
// value = [1, kuda, apalahitunilai]
// key.map((item, index) => `${item}="${value[index]}"` ==> `id="1"`, `name="kuda"` 