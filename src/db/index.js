 const { Client } = require("pg");
 const { configDB } = require("./config");
 module.exports = {
   query: (text, callback, client) => {
     return client.query(text, (err, res) => {
       callback(err, res);
     });
   },
   queryParams: (text, params, callback, client) => {
     return client.query(text, params, (err, res) => {
       callback(err, res);
     });
   },
   getClient: (callback) => {
     const client = new Client(configDB);
     client.connect((err, client, done) => {
       callback(err, client, done);
     });
   }
 };