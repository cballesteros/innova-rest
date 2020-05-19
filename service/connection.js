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

const dbInstance = pgp(connection); // database instance;

module.exports = dbInstance;
