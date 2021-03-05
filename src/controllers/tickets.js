const ticket = require('../models/tickets')
const response = require('../helpers/response')

exports.buySeat = async (req, res) => {
  const { idCinema, idSeats, idShowtimes, date } = req.body
  let error = false
  for (let i = 0; i < idSeats.length; i++) {
    const idSeat = idSeats[i];
    console.log(idSeat)
    const isTicketExist = await ticket.getTicket({ idCinema, idSeat, idShowtimes, date })
  if (isTicketExist.length <= 0) {
    {
        const buyTicket = await ticket.buyTicket({ idCinema, idSeat, idShowtimes, date })
        if (buyTicket.insertId < 0) {
          error = true
          break
    }
  }
} else {
  error = true
  break
}
}
if(!error) {
  return response(res, 200, true, 'Ticket purchased')
} else {
return response(res, 400, false, 'Ticket sold') 

}
    
}

exports.paymentMethod = async (req, res) => {
  const { idUser, phoneNumber, email, fullname, paymentMethod } = req.body
  const pay = await ticket.pay({ idUser, phoneNumber, email, fullname, paymentMethod })
  if (pay.insertId > 0) {
    return response(res, 200, true, 'Payment success')
  } else {
    return response(res, 500, false, 'Payment failed')
  }
}

exports.getSeat = async (req, res) => {
  const {idCinema, date, idShowtimes} = req.query
  console.log(idCinema)
  const seats = await ticket.getTicketById({idCinema, date, idShowtimes})
  if (seats.length > 0) {
    return response(res, 200, true, 'List of Seats', seats)
  } else {
    return response(res, 200, false, 'Failed to get seat list', [])
  }
}