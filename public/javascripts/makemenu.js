import { $ } from "./nQm.js";
import { menu, admin } from "./menu.js";

export let createMenu = function (where) {
  let nav = document.createElement("nav");
  nav.setAttribute("id", "nav");
  nav.classList.add("nav");

  //Set burger menu
  let burger = document.createElement("input");
  burger.setAttribute("type", "checkbox");
  burger.setAttribute("id", "nav__checkbox");
  burger.classList.add("nav__checkbox");
  nav.appendChild(burger);

  let label = document.createElement("label");
  label.setAttribute("for", "nav__checkbox");
  label.classList.add("nav__toggle");

  let burgerOn = document.createElement("i");
  let burgerOff = document.createElement("i");
  burgerOn.classList.add("fas", "fa-bars", "hamburger");
  burgerOff.classList.add("fas", "fa-times", "close");

  label.appendChild(burgerOn);
  label.appendChild(burgerOff);
  nav.appendChild(label);
  let list = document.createElement("ul");
  list.className = "nav__menu";
  nav.appendChild(list);

  //add logo
  let logo = document.createElement("li");
  let frontpage = document.createElement("a");
  frontpage.setAttribute("href", "velkommen");
  let logoImg = document.createElement("img");
  logoImg.className = "logo";
  logoImg.setAttribute("src", "logo_white.png");
  frontpage.appendChild(logoImg);
  logo.appendChild(frontpage);
  list.appendChild(logo);

  //Create menu items
  admin.forEach(function (item) {
    let listitem = document.createElement("li");
    let link = document.createElement("a");
    link.setAttribute("href", item.url);
    let text = document.createTextNode(item.text);
    link.appendChild(text);
    listitem.appendChild(link);
    list.appendChild(listitem);
  });
  menu.forEach(function (item) {
    let listitem = document.createElement("li");
    let link = document.createElement("a");
    link.setAttribute("href", item.url);
    let text = document.createTextNode(item.text);
    link.appendChild(text);
    listitem.appendChild(link);
    list.appendChild(listitem);
  });

  $(where).appendChild(nav);
};
