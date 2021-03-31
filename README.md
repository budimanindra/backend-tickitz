# TICKITZ BACKEND APP WITH NODE AND MYSQL
This is non-optimized minimal backend app with MySQL and node. This app designed to handle the backend of Tickitz Movie Reservation App

## Requirements
- NodeJS v12 LTS
- XAMPP

## How To Setting the Database
- Instal XAMPP
- Run apache and mySQL module
- Open localhost/phpmyadmin
- Make database 'backend-tickitz'
- Import 'backend-tickitz.sql' to the database

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
- GET     http://localhost:PORT/movies Route for user to get movies list 
- GET     http://localhost:PORT/movies/:id Route for user to get selected movies by id
- GET     http://localhost:PORT/movies/upcoming-movies-pagination Route for user to get upcoming movies
- GET     http://localhost:PORT/movies/now-showing-movies-pagination Route for user to get now showing movies

- POST    http://localhost:PORT/tickets/ Route for user to buy seat
- POST    http://localhost:PORT/tickets/payment Route for user to save payment details
- GET     http://localhost:PORT/tickets/ Route for user to get seat info

- GET     http://localhost:PORT/profile/ Route for user to get logged in user details
- PATCH   http://localhost:PORT/profile/update-profile-details Route for user to edit profile details
- PATCH   http://localhost:PORT/update-profile-photo Route for user to edit profile photo

- GET     http://localhost:PORT/genres/ Route for user to get all genres
- GET     http://localhost:PORT/genres/:id Route for user to get selected genres by id

- GET     http://localhost:PORT/cities/ Route for user to get all cities
- GET     http://localhost:PORT/cities/:id Route for user to get selected cities by id

- GET     http://localhost:PORT/cinemas/ Route for user to get all cinemas
- GET     http://localhost:PORT/cinemas/:id Route for user to get selected cinemas by id
- POST    http://localhost:PORT/cinemas/ Route for user to create a cinema
- PUT     http://localhost:PORT/cinemas/:id Route for user to update selected cinema by id
- DELETE  http://localhost:PORT/cinemas/:id Route for user to delete selected cinema by id

- GET     http://localhost:PORT/casts/ Route for user to get all casts
- GET     http://localhost:PORT/casts/:id Route for user to get selected casts by id
- POST    http://localhost:PORT/casts/ Route for user to create a casts
- PUT     http://localhost:PORT/casts/:id Route for user to update selected casts by id
- DELETE  http://localhost:PORT/casts/:id Route for user to delete selected casts by id

- POST    http://localhost:PORT/auth/login Route for user to login
- POST    http://localhost:PORT/auth/register Route for user to register an account

## App Flow
![alt text](https://github.com/budimanindra/backend-tickitz/blob/main/flowchart-create.png?raw=true)
![alt text](https://github.com/budimanindra/backend-tickitz/blob/main/flowchart-read.png?raw=true)
![alt text](https://github.com/budimanindra/backend-tickitz/blob/main/flowchart-update.png?raw=true)
![alt text](https://github.com/budimanindra/backend-tickitz/blob/main/flowchart-delete.png?raw=true)