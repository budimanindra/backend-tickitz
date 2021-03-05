const db = require('../helpers/db')

// tanpa pagination
// exports.getAllCinemas = (cb) => {
//     const query = db.query(`
//     SELECT * FROM cinemas
//   `, (err, res, field) => {
//         if (err) throw err
//         // console.log(field)
//         cb(res)
//     })
//     console.log(query.sql)
// }

exports.getCinemaById = (id, cb) => {
  const query = db.query(`
    SELECT * FROM cinemas WHERE id=${id}
  `, (err, res, field) => {
    if (err) throw err
    // console.log(field)
    cb(res)
  })
  console.log(query.sql)
}

exports.createCinema = (data = {}, cb) => {
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

exports.deleteCinemaById = (id, cb) => {
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

exports.updateCinemaById = (id, data, cb) => {
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



// 

exports.getCinemasByCondition = (cond, cb) => {
  const query = db.query(`
    SELECT * FROM
    cinemas WHERE name LIKE "%${cond.search}%"
    ORDER BY ${cond.sort} ${cond.order}
    LIMIT ${cond.dataLimit} OFFSET ${cond.offset}
    `, (err, res, field) => {
    if (err) throw err
    cb(res)
  })
  console.log(query.sql)
}

exports.createCinemasAsync = (data = {}, cb) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO cinemas
    (${Object.keys(data).join()})
    VALUES
    (${Object.values(data).map(item => `"${item}"`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getAllCinemasByMovieIdAsync = (id, city, date) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT c.id, c.name, c.image, c.address, ci.name, c.priceWeekend, c.priceWeekdays, st.showTimes, st.id AS idShowtime
    FROM cinemas c
    INNER JOIN show_times_cinemas stc ON c.id = stc.idCinemas
    INNER JOIN show_times st ON st.id = stc.idShowTimes
    INNER JOIN cinemas_movies cm ON cm.idCinemas = c.id
    INNER JOIN movies m ON m.id = cm.idMovies
    INNER JOIN cities_cinemas cc ON c.id = cc.idCinemas
    INNER JOIN cities ci ON cc.idCities = ci.id
    WHERE m.id=${id} AND ci.name='${city}' AND m.releaseDate <= '${date}' AND m.endDate >= '${date}'
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}