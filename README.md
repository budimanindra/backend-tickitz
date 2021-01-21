# TICKITZ BACKEND APP WITH NODE AND MYSQL
This is non-optimized minimal backend app with MySQL and node. This app designed to handle the backend of Tickitz Movie Reservation App

## Requirements
- NodeJS v12 LTS
- XAMPP

## How To Setting the Database
- Instal XAMPP
- Run apache and mySQL module
- Open localhost/phpmyadmin
- Make MySQL Database which is contains movie, genre, and cinema

## How To Run This App
- Make sure you had clone this repo
- Copy environment from `.env.example` to `.env`
- Configure your `.env` file according to your MySQL credentials
- Open your terminal in this project and run 
  ```
  npm i
  ```
- And then
  ```
  npx nodemon
  ```

## API SPECS
- GET http://localhost:PORT/movies Route for get movies list
- GET http://localhost:PORT/cinemas Route for get cinemas list
- GET http://localhost:PORT/genres Route for get genres list
- GET http://localhost:PORT/movies/:id Route for get movie details by id
- GET http://localhost:PORT/cinemas/:id Route for get cinema details by id
- GET http://localhost:PORT/genres/:id Route for get genre details by id
- POST http://localhost:PORT/movies Route for add movie
- POST http://localhost:PORT/cinemas Route for add cinema
- POST http://localhost:PORT/genres Route for add genre
- PUT http://localhost:PORT/movies/:id Route for edit movie details by id
- PUT http://localhost:PORT/cinemas/:id Route for edit cinema details by id
- PUT http://localhost:PORT/genres/:id Route for edit genre details by id
- DELETE http://localhost:PORT/movies/:id Route for delete movie by id
- DELETE http://localhost:PORT/cinemas/:id Route for delete cinema by id
- DELETE http://localhost:PORT/genres/:id Route for delete genre by id