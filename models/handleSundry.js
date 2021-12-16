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
  async createCard(obj) {
    //creating variables
    console.log(obj.POST);
    let type = obj.POST.type;
    let rounds = obj.POST.rounds;
    let exercises = [
      obj.POST.exercise1,
      obj.POST.exercise2,
      obj.POST.exercise3,
      obj.POST.exercise4,
    ];
    let reps = [obj.POST.reps1, obj.POST.reps2, obj.POST.reps3, obj.POST.reps4];
    let hashtag = obj.POST.hashtag;
    let text = obj.POST.text;
    let time = obj.POST.time;
    let videoURL = obj.POST.qr;
    let difficulty = obj.POST.level;
    let category = 1; //hardcode Core category

    const dbh = await maria.createConnection(dbp);
    let sqlNewCard = `
    INSERT INTO card (name, difficulty, video_url, type, category_id) 
    VALUES
    ('${hashtag}',	${difficulty},	'${videoURL}', '${type}',	${category})
    `;
    let sqlType = `
    INSERT INTO repsandrounds (rounds, card_id)
    SELECT ${rounds}, card_id from card where card.name ='${hashtag}';
    `;

    await dbh.query(sqlNewCard);
    await dbh.query(sqlType);

    //Taking exercise name, and find the corresponding ID.
    let exerciseID = [];
    // exercises.forEach((item, i) => {
    //   rows = await dbh.query(
    //      `select exercise_id from exercise where name="${item}"`
    //    );
    //    exerciseID[i] = rows;
    //   console.log(exerciseID);
    //   exerciseID.push(sqlExerciseID[0]);
    // });

    // let sqlExercises = "";
    // if (type === "repsandrounds") {
    //   exerciseID.forEach((id, i) => {
    //     sqlExercises = `
    //     INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps, ordernumber)
    //     SELECT rar.repsandrounds_id, ${id}, ${reps[i]}, ${i + 1}
    //     FROM repsandrounds rar 
    //     LEFT JOIN card c ON rar.card_id = c.card_id
    //     WHERE c.name = '${hashtag}';
    //     `;
    //     await dbh.query(sqlExercises);
    //   });
    // }
  },

  async listExercises() {
    const dbh = await maria.createConnection(dbp);
    const rows = await dbh.query(`select exercise_id, name from exercise`);
    return rows;
  },

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

  async isAdmin(obj) {
    const dbh = await maria.createConnection(dbp);
    let sql = `select isadmin from user where email = '${obj.POST.email}'`;
    let rows = await dbh.query(sql);
    return rows;
  },
};
