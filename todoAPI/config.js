'use strict'

const mongoose = require('mongoose');

let conn = null
async function dbConnection () {
    if (conn === null) {
      const database = await mongoose.connect('mongodb+srv://adm:adm@cluster0.hvdaa.mongodb.net/myFirstDatabase?retryWrites=true&w=majority', {
        useUnifiedTopology: true,
        useNewUrlParser: true
      })
      conn = database.connections[0].readyState
    }
  }

module.exports = {
  dbConnection
}
