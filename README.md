# Universal Pattern Microservice Example

[Spanish version](./README.ES.MD)

This project aims to develop a social network for car enthusiasts. The system will allow users to search for cars by brand, and each user can review the cars they find. These reviews will appear in the user's feed.

Other social network users can leave comments on the reviews, as well as like them.

# How to Run the Example Without Docker?

Before running the example, you need to have Node.js v18 or higher and MongoDB 6 or higher installed.

If necessary, you can edit the `.env` file to change the database access configuration, port, etc.


```bash
$ git clone https://github.com/lortmorris/universal-pattern-example.git
$ cd universal-pattern-example
$ npm install
$ node --env-file=.env index.js
```

Now you can open your browser and view the [endpoints documentation](http://localhost:3500/services/docs)


# Running with Docker

o run the example via docker, you need to have Docker installed. Executing `docker compose up` will create two containers, one for MongoDB and another for the microservice.

```bash
$ sudo docker compose up
```


# Defined Modules

Remember that [Universal Pattern](https://www.npmjs.com/package/universal-pattern) aims to accelerate development, offering the possibility to write endpoints from a yaml file (swagger).


## Users
The user module has some important details:
- It allows login and returns a jwt.
- When the example is run for the first time, a level 50 user (the administrator) will be created:
  - mail@example.com / SET_PASSWORD
- Some endpoints require auth, meaning the user must be authenticated.
- Some endpoints require level 50 (admin).


## Brands
These are the car brands. The brands of the cars should be in a collection.

Only a level 50 user can create brands.

## Cars
This module works with the cars themselves. To insert a new car, we must consider:

- The available colors are in an enum, so if we pass a color that is not in the list, UP will return an error.
- The `brandId` must be a valid MongoDB id and exist in the `brand` collection.

# Autocannon
```bash
$ npm install autocannon -g
$ autoannon "http://localhost:3500/services/users?limit=1&page=1"
```
