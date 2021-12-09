"use strict";

module.exports = class User {
  constructor(email, firstname, lastname, phonenumber) {
    (this.email = email),
      (this.firstname = firstname),
      (this.lastname = lastname),
      (this.phonenumber = phonenumber);
  }

  toString() {
    return `<tr><td>${this.email}</td><td>${this.firstname}</td><td>${this.lastname}</td><td>${this.phonenumber}</td></tr>`;
  }
};
