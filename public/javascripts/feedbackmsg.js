import { createMenu } from "./makemenu.js";

const initialize = function () {
    createMenu('menu');
}

window.addEventListener('load', initialize);
