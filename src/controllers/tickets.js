const ticket = require('../models/tickets')
const response = require('../helpers/response')
const userModel = require('../models/users')

exports.buySeat = async (req, res) => {
  const { idCinema, idSeats, idShowtimes, date } = req.body
  let error = false
  for (let i = 0; i < idSeats.length; i++) {
    const idSeat = idSeats[i];
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
  const seats = await ticket.getTicketById({idCinema, date, idShowtimes})
  if (seats.length > 0) {
    return response(res, 200, true, 'List of Seats', seats)
  } else {
    return response(res, 200, false, 'Failed to get seat list', [])
  }
}

exports.makeTicketHistory = async (req, res) => {
  var {id} = req.userData   
  const {movieName, date, showTimes, image, address} = req.body
  try {
    await ticket.makeTicketHistory({idUser: id, movieName, date, showTimes, image, address})
    return response(res, 200, true, 'Successfully to make ticket history')
  } catch (err) {
    return response(res, 500, false, 'Server Error')
  }
}

exports.getTicketHistory = async (req, res) => {
  var {id} = req.userData
  try {
    const results = await ticket.getTicketHistory(idUser= id)
    if (results.length > 0) {
    return response(res, 200, true, 'Successfully to get ticket history', results)
    }
    return response(res, 200, true, 'This user never buy a ticket', [])
  } catch (err) {
    return response(res, 500, false, 'Server Error')
  }
}