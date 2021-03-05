const express = require('express')
const bodyParser = require('body-parser')
const morgan = require('morgan')
const cors = require('cors')
const dotenv = require('dotenv')

dotenv.config()
const { APP_PORT } = process.env
const app = express()

app.use(bodyParser.urlencoded({ extended: false }))
app.use(morgan('dev'))
app.use(cors('*'))

app.use('/auth', require('./src/routes/auth'))
app.use('/movies', require('./src/routes/movies'))
app.use('/admin/movies', require('./src/routes/adminMovies'))
app.use('/cinemas', require('./src/routes/cinemas'))
// app.use('/admin/cinemas', require('./src/routes/adminCinemas'))
app.use('/genres', require('./src/routes/genres'))
app.use('/admin/genres', require('./src/routes/adminGenres.js'))
app.use('/casts', require('./src/routes/casts'))
app.use('/cities', require('./src/routes/cities'))
app.use('/tickets', require('./src/routes/tickets'))



app.get('/', (request, response) => {
  return response.json({
    success: true,
    message: 'Backend is running well'
  })
})

app.listen(APP_PORT, () => {
  console.log(`App is running on port ${APP_PORT}`)
})