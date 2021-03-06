const db = require('../helpers/db')

exports.getGenreById = (id, cb) => {
    const query = db.query(`
    SELECT * FROM genres WHERE id=${id}
  `, (err, res, field) => {
        if (err) throw err
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

// 

exports.checkGenresAsync = (data = [], cb) => {
    return new Promise((resolve, reject) => {
      const query = db.query(`
      SELECT * FROM genres
      WHERE id IN (${data.map(item => item).join()})
      `, (err, res, field) => {
        if (err) reject(err)
        resolve(res)
      })
      console.log(query.sql)
    })
  }

  exports.getGenresByCondition = (cond, cb) => {
    const query = db.query(`
      SELECT * FROM
      genres WHERE name LIKE "%${cond.search}%"
      ORDER BY ${cond.sort} ${cond.order}
      LIMIT ${cond.dataLimit} OFFSET ${cond.offset}
      `, (err, res, field) => {
      if (err) throw err
      cb(res)
    })
    console.log(query.sql)
  }