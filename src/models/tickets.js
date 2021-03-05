const db = require('../helpers/db')

exports.getTicketById = (ticketDetail) => {
    return new Promise((resolve, reject) => {
      const query = db.query(`
      SELECT t.id, t.idCinema, t.date, s.position, st.showTimes FROM ticket t
      INNER JOIN seat s ON t.idSeat = s.id
      INNER JOIN show_times st ON t.idShowtimes = st.id 
      WHERE t.idCinema = ${ticketDetail.idCinema}
      AND t.date = "${ticketDetail.date}"
      AND t.idShowtimes = ${ticketDetail.idShowtimes}
      `, (err, res, field) => {
        if (err) reject(err)
        resolve(res)
      })
      console.log(query.sql)})
  }

  exports.getTicket = (ticketDetail) => {
    return new Promise((resolve, reject) => {
      const query = db.query(`
      SELECT * FROM ticket
      WHERE ${Object.keys(ticketDetail).map(item => `${item}="${ticketDetail[item]}"`).join(' AND ')} 
      `, (err, res, field) => {
        if (err) reject(err)
        resolve(res)
      })
      console.log(query.sql)})
  }



exports.buyTicket = (ticketDetail) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO ticket
    (${Object.keys(ticketDetail).join()})
    VALUES
    (${Object.values(ticketDetail).map(item => `"${item}"`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query.sql)}
  )
}

exports.pay = (paymentDetail) => {
  return new Promise((resolve, reject) => {
    const query = db.query(`
    INSERT INTO payment
    (${Object.keys(paymentDetail).join()})
    VALUES
    (${Object.values(paymentDetail).map(item => `"${item}"`).join(',')})
    `, (err, res, field) => {
      if (err) reject(err)
      resolve(res)
    })
    console.log(query)}
  )
}