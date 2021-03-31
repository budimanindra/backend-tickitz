const db = require('../helpers/db')

// tanpa pagination
// exports.getAllMovies = (cb) => {
//     const query = db.query(`
//     SELECT * FROM movies
//   `, (err, res, field) => {
//         if (err) throw err
//         // console.log(field)
//         cb(res)
//     })
//     console.log(query.sql)
// }

// exports.getMovieById = (id, cb) => {
//   const query = db.query(`
//       SELECT m.id, m.name, m.image, m.releaseDate, m.endDate, m.duration, m.directedBy, m.synopsis, g.name as genreName, c.name as castName
//       FROM movies m
//       INNER JOIN movie_genres mg ON m.id=mg.idMovie
//       INNER JOIN genres g ON g.id=mg.idGenre
//       INNER JOIN movie_casts mc ON m.id=mc.idMovie
//       INNER JOIN casts c ON c.id=mc.idCast
//       WHERE m.id=${id}
//   `, (err, res, field) => {
//     if (err) throw err
//     // console.log(field)
//     cb(res)
//   })
//   console.log(query.sql)
// }

exports.getMovieById = (id) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT m.id, m.name, m.image, m.releaseDate, m.endDate, m.duration, m.directedBy, m.synopsis, g.name as genreName, c.name as castName
      FROM movies m
      INNER JOIN movie_genres mg ON m.id=mg.idMovie
      INNER JOIN genres g ON g.id=mg.idGenre
      INNER JOIN movie_casts mc ON m.id=mc.idMovie
      INNER JOIN casts c ON c.id=mc.idCast
      WHERE m.id=${id}
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.createMovie = (data = {}, cb) => {
  const query = db.query(`
  INSERT INTO movies
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

exports.deleteMovieById = (id, cb) => {
  const query = db.query(`
  DELETE FROM movies
  WHERE id = ${id}
  `, (err, res, field) => {
    if (err) throw err
    console.log(field)
    cb(res)
  })
  console.log(query.sql)
}

exports.updateMovieById = (id, data, cb) => {
  const key = Object.keys(data)
  const value = Object.values(data)
  const query = db.query(`
    UPDATE movies
    SET ${key.map((item, index) => `${item}="${value[index]}"`)}
    WHERE id=${id}
  `, (err, res, field) => {
    if (err) throw err
    cb(res)
  })
  console.log(query.sql)
}



// 

exports.getMoviesByCondition = (cond, cb) => {
  const query = db.query(`
    SELECT * FROM
    movies WHERE name LIKE "%${cond.search}%"
    ORDER BY ${cond.sort} ${cond.order}
    LIMIT ${cond.dataLimit} OFFSET ${cond.offset}
    `, (err, res, field) => {
    if (err) throw err
    cb(res)
  })
  console.log(query.sql)
}

exports.createMoviesAsync = (data = {}, cb) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO movies
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

exports.getMovieByIdWithGenreAsync = (id) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    SELECT m.id, m.name, m.image, m.releaseDate, m.endDate, m.duration, m.directedBy, m.synopsis, g.name as genreName
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE m.id=${id}
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getMoviesNowShowing = () => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    console.log(todayString)
    const query = db.query(`
    SELECT m.id, m.name, m.image, m.releaseDate, g.name as genreName
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate <= '${todayString}' AND '${todayString}' <= endDate
    ORDER BY releaseDate ASC
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)
  })
}

exports.getUpcomingMovies = () => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT m.id, m.name, m.image, m.releaseDate, g.name as genreName
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate > '${todayString}'
    ORDER BY releaseDate ASC
  `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
  })
}

exports.getUpcomingMoviesCount = () => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT COUNT(distinct m.id)
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate > '${todayString}'
    ORDER BY releaseDate ASC
  `, (err, res, field) => {
      if (err) reject(err)
      return resolve(res[0]['COUNT(distinct m.id)'])
    })
  })
}

exports.getUpcomingMoviesCountSearch = (data) => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT COUNT(distinct m.id)
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate > '${todayString}' AND m.name LIKE '%${data.keyword}%'
    ORDER BY m.${data.by} ${data.sort}
  `, (err, res, field) => {
      if (err) reject(err)
      console.log(query.sql)
      return resolve(res[0]['COUNT(distinct m.id)'])
    })
  })
}

exports.findUpcomingMovies = (data) => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT m.id, m.name, m.image, m.releaseDate, g.name as genreName
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate > '${todayString}' AND m.name LIKE '%${data.keyword}%'
    GROUP BY m.name
    ORDER BY ${data.by} ${data.sort}
    ${data.offset || data.limit ? `LIMIT ${data.offset}, ${data.limit}` : ''}
  `, (err, res, field) => {
      if (err) reject(err)
      console.log(query.sql)
      resolve(res)
    })
  })
}

exports.getNowShowingMoviesCount = () => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT COUNT(distinct m.id)
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate <= '${todayString}' AND '${todayString}' <= endDate
    ORDER BY releaseDate ASC
  `, (err, res, field) => {
      if (err) reject(err)
      return resolve(res[0]['COUNT(distinct m.id)'])
    })
  })
}

exports.getNowShowingMoviesCountSearch = (data) => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT COUNT(distinct m.id)
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate <= '${todayString}' AND '${todayString}' <= endDate AND m.name LIKE '%${data.keyword}%'
    ORDER BY m.${data.by} ${data.sort}
  `, (err, res, field) => {
      if (err) reject(err)
      console.log(query.sql)
      return resolve(res[0]['COUNT(distinct m.id)'])
    })
  })
}

exports.findNowShowingMovies = (data) => {
  return new Promise((resolve, reject) => {
    const today = new Date();
    const todayString = today.toISOString().split('T')[0]
    const query = db.query(`
    SELECT m.id, m.name, m.image, m.releaseDate, g.name as genreName
    FROM movies m
    INNER JOIN movie_genres mg ON m.id=mg.idMovie
    INNER JOIN genres g ON g.id=mg.idGenre
    WHERE releaseDate <= '${todayString}' AND '${todayString}' <= endDate AND m.name LIKE '%${data.keyword}%'
    GROUP BY m.name
    ORDER BY ${data.by} ${data.sort}
    ${data.offset || data.limit ? `LIMIT ${data.offset}, ${data.limit}` : ''}
  `, (err, res, field) => {
      if (err) reject(err)
      console.log(query.sql)
      resolve(res)
    })
  })
}