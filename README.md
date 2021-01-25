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
- GET http://localhost:PORT/movies Route for user to get movies list
- GET http://localhost:PORT/cinemas Route for for user to get cinemas list
- GET http://localhost:PORT/genres Route for  for user to get genres list

- GET http://localhost:PORT/movies/:id Route for user to get movie details by id
- GET http://localhost:PORT/cinemas/:id Route for user to get cinema details by id
- GET http://localhost:PORT/genres/:id Route for user to get genre details by id

- GET http://localhost:PORT/admin/movies Route for admin to get movies list
- GET http://localhost:PORT/admin/movies/:id Route for admin to get movie details by id
- GET http://localhost:PORT/admin/genres Route for admin to get genres list
- GET http://localhost:PORT/admin/genres/:id Route for admin to get genre details by id

- POST http://localhost:PORT/admin/movies Route for admin to add movie
- POST http://localhost:PORT/cinemas Route for user to add cinema
- POST http://localhost:PORT/admin/genres Route for admin to add genre

- PUT http://localhost:PORT/admin/movies/:id Route for admin to edit movie details by id
- PUT http://localhost:PORT/cinemas/:id Route for user to edit cinema details by id
- PUT http://localhost:PORT/admin/genres/:id Route for admin to edit genre details by id

- DELETE http://localhost:PORT/admin/movies/:id Route for admin to delete movie by id
- DELETE http://localhost:PORT/cinemas/:id Route for user to delete cinema by id
- DELETE http://localhost:PORT/admin/genres/:id Route for admin to delete genre by id