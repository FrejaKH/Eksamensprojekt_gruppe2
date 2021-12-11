
import { makeMenu} from "./nQm.js";

let createMenu = function () {
    makeMenu('menu');
    let logo = document.createElement('img');
    logo.src = "logo_white.png";
    logo.setAttribute("id", "logo_menu")
    let nav = document.getElementById("nav");
    nav.appendChild(logo);

};


window.addEventListener('load', createMenu);