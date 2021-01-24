exports.getUsersByConditionAsync = (cond) => {
    return new Promise((resolve, reject) => {
      const query = db.query(`
      SELECT * FROM users WHERE ${Object.keys(cond).map(item => `${item}="${cond[item]"}`).join('AND')}
    `, (err, res, field) => {
        if (err) reject(err)
        resolve(res)
      })
      console.log(query.sql)
    })
  }