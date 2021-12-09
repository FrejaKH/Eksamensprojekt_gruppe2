"use strict";

module.exports = class User {
  constructor(firstname, lastname, phonenumber, email) {
    (this.email = email),
      (this.firstname = firstname),
      (this.lastname = lastname),
      (this.phonenumber = phonenumber);
  }

  toString() {
    return `<tbody>
    <tr>
    <td><span>Fornavn:</span> ${this.firstname}</td>
    </tr>
    <tr>
    <td><span>Efternavn:</span> ${this.lastname}</td>
    </tr>
    <tr>
    <td><span>Telefonnummer:</span> ${this.phonenumber}</td>
    </tr>
    <tr>
    <td><span>E-mail:</span> ${this.email}</td>
    </tr>
    </tbody>
    </table>`;
  }
};
