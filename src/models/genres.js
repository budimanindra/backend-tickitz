const db = require('../helpers/db')

exports.getAllGenre = (cb) => {
    const query = db.query(`
    SELECT * FROM genres
  `, (err, res, field) => {
        if (err) throw err
        // console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.getGenreById = (id, cb) => {
    const query = db.query(`
    SELECT * FROM genres WHERE id=${id}
  `, (err, res, field) => {
        if (err) throw err
        // console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.createGenre = (data = {}, cb) => {
    const query = db.query(`
  INSERT INTO genres
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

exports.deleteGenre = (id, cb) => {
    const query = db.query(`
  DELETE FROM genres
  WHERE id = ${id}
  `, (err, res, field) => {
        if (err) throw err
        console.log(field)
        cb(res)
    })
    console.log(query.sql)
}

exports.updateGenre = (id, data, cb) => {
    const key = Object.keys(data)
    const value = Object.values(data)
    const query = db.query(`
    UPDATE genres
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