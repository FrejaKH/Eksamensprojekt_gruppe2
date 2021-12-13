"use strict";

// CREATE USER IF NOT exists piefituser@localhost IDENTIFIED BY 'test';
// GRANT ALL privileges ON piefitdatabase.* TO piefituser@localhost;

module.exports = {
  host: "127.0.0.1",
  user: "piefituser",
  password: "test",
  database: "piefitdatabase",
};
