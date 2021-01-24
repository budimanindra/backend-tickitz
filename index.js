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

app.use('/movies', require('./src/routes/movies'))
app.use('/admin/movies', require('./src/routes/adminMovies'))
app.use('/cinemas', require('./src/routes/cinemas'))
// app.use('/admin/cinemas', require('./src/routes/adminCinemas'))
app.use('/genres', require('./src/routes/genres'))
app.use('/admin/genres', require('./src/routes/adminGenres.js'))
app.use('/casts', require('./src/routes/casts'))


app.get('/', (request, response) => {
  return response.json({
    success: true,
    message: 'Backend is running well'
  })
})

app.listen(APP_PORT, () => {
  console.log(`App is running on port ${APP_PORT}`)
})


// 


// const express = require("express");

// const app = express();

// const db = require("./src/helpers/dbsqlz");

// const User = require("./src/user  ")

// app.get("/", (req, res) => res.send(""))

// db.authenticate().then(() =>
//     console.log('berhasil terhubung dengan db')
// );

// app.post("/crud", async (req, res) => {
//     try {
//         const { username, email, password } = req.body

//         const newUser = new User({
//             username, email, password
//         })
        
//         await newUser.save();

//         res.json(newUser);
//     } catch (err) {
//         console.error(err.massage);
//         res.status(500).send("server error")
//     }
// })

// app.listen (8000, () => console.log('port berjalan di 8000'))