"use strict";
/*
 * check if routed handler function exists
 * if yes call it, else complain
 */
const handlers = require("../controllers/handlers"); // handlers module
const requestHandlers = {
  // application urls here
  GET: {
    "/": handlers.home,
    "/login": handlers.login,
    "/signup": handlers.signup,
    "/logout": handlers.logout,
    "/profile": handlers.profile,
    "/velkommen": handlers.velkommen,
    "/myinformation": handlers.myinformation,
    "/changeinfo": handlers.changeinfo,
    "/feedbackmsg": handlers.feedbackmsg,
    "/mycards": handlers.mycards,
    "/categories": handlers.categories,
    "/core": handlers.core,
    "/corecard1": handlers.corecard1,
    "/admin": handlers.admin,
    "/notfound": handlers.notfound,
    js: handlers.js,
    css: handlers.css,
    png: handlers.png,
    jpg: handlers.jpg,
    svg: handlers.svg,
    mov: handlers.mov,
    ico: handlers.ico,
  },
  POST: {
    "/contact": handlers.receiveContacts,
    "/login": handlers.verifyLogin,
    "/signup": handlers.signupUser,
    "/newcard": handlers.newCard,
  },
};

module.exports = {
  route(req, res, bodydata) {
    let urls = req.url.split("?"); // separate query string from url
    req.url = urls[0]; // clean url
    let arr = req.url.split("."); // filename with suffix
    let ext = arr[arr.length - 1]; // get suffix
    if (typeof requestHandlers[req.method][req.url] === "function") {
      // look for route
      requestHandlers[req.method][req.url](req, res, bodydata); // if found, call
    } else if (typeof requestHandlers[req.method][ext] === "function") {
      // if css, js, png, or
      requestHandlers[req.method][ext](req, res); // get that
    } else {
      // else
      requestHandlers.GET["/notfound"](req, res); // use notfound
    }
  },
};
