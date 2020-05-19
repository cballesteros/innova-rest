const promise = require('bluebird'); // or any other Promise/A+ compatible library;

const initOptions = {
    promiseLib: promise // overriding the default (ES6 Promise);
};

const pgp = require('pg-promise')(initOptions);

const connection = {
    host: 'localhost', // 'localhost' is the default;
    port: 5432, // 5432 is the default;
    database: 'innova',
    user: 'postgres', // 'postgres' is the default
    password: '25428506'
};

const connectionString = process.env.DATABASE_URL;

const dbInstance = pgp(connectionString); // database instance;
//const dbInstance = pgp(connection); // database instance;

const { Pool } = require('pg');
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

module.exports = dbInstance;
//module.exports = pool;
