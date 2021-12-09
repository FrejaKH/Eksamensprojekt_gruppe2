"use strict";
/*
 * models
 * handlers for data manipulation
 */
const maria = require("mariadb"); // file system access
const dbp = require("./dbParams.js");
const bcrypt = require("bcryptjs");
const cook = require("../controllers/sess"); // session cookies

module.exports = {
  // async updContacts(obj) {
  //     const dbh = await maria.createConnection(dbp);
  //     let hashed = await bcrypt.hash(obj.POST.password, 10); //Password + salt (1)
  //     let sql = `insert into user values('${obj.POST.name}', '${obj.POST.email}', '${obj.POST.phone}', '${hashed}')`;
  //     await dbh.query(sql);
  // },
  async updContacts(obj) {
    const dbh = await maria.createConnection(dbp);
    let hashed = await bcrypt.hash(obj.POST.password, 10); //Password + salt (1)
    let sql = `insert into user (email, firstname, lastname, phonenumber, password, isadmin, theme_id)
        values('${obj.POST.email}', '${obj.POST.firstname}', '${obj.POST.lastname}', '${obj.POST.phonenumber}', '${hashed}', false, 1)`;
    await dbh.query(sql);
  },

  async showContacts() {
    const dbh = await maria.createConnection(dbp);
    const rows = await dbh.query(`select * from user`);
    return rows;
  },

  async userData(req, res) {
    let session = cook.cookieObj(req, res); // create session object
    let chk = session.get("login", { signed: true });
    const dbh = await maria.createConnection(dbp);
    const rows = await dbh.query(
      `select * from user where firstname = '${chk}'`
    );
    return rows;
  },

  async createUser(obj) {
    const dbh = await maria.createConnection(dbp);
    let hashed = await bcrypt.hash(obj.POST.password, 10); //Password + salt (1)
    let sql = `insert into user (email, firstname, lastname, phonenumber, password, isadmin, theme_id)
        values('${obj.POST.email}', '${obj.POST.firstname}', '${obj.POST.lastname}', '${obj.POST.phonenumber}', '${hashed}', false, 1)`;
    await dbh.query(sql);
  },

  async verify(obj) {
    const dbh = await maria.createConnection(dbp);
    let sql = `select firstname, password from user where email = '${obj.POST.email}'`;
    let rows = await dbh.query(sql);
    return rows;
  },
};
