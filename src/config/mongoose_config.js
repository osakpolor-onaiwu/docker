const mongoose = require("mongoose");
const app_config = require("./app_config");

mongoose.connect(app_config.mongouri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;

db.on("error", (e) => {
  //log error
  console.log("mongoose connection error");
});

db.on("connected", (e) => {
  //log here
  console.log("mongoose connected successfully");
});

db.on("disconnected", (e) => {
  //log here
  console.log("mongoose disconnected successfully");
});

module.exports = db;
