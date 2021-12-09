"use strict";
import { makeMenu, setTitles, setFooter } from "./nQm.js";

// const doSomething = function () {
//     makeMenu('menu');
//     setTitles('Native Node, Sample');
//     setFooter('nml', 2021);
// }
// window.addEventListener('load', doSomething);

const $ = function (foo) {
    return document.getElementById(foo);
  };

  //select an element(bar) within an element of ID(foo)
  const $$q = function (foo, bar) {
    return document.getElementById(foo).querySelector(bar);
  };

const $qa = function (foo) {
    return document.querySelectorAll(foo);
  };

  const $q = function (foo) {
    return document.querySelector(foo);
  };



//   $q('[data-card-duration]').innerText = '10/25 SEC';
//   (() => {
//   const cardTypeInput = $('card-type');
  const cardInputs = {
      "type": $$q('add_cards','[name="type"]'),
      "rounds": $$q('add_cards','[name="rounds"]'),
      "exercise1": $$q('add_cards','[name="exercise1"]'),
      "exercise2": $$q('add_cards','[name="exercise2"]'),
      "exercise3": $$q('add_cards','[name="exercise3"]'),
      "exercise4": $$q('add_cards','[name="exercise4"]'),
      "hashtag": $$q('add_cards','[name="hashtag"]'),
      "text": $$q('add_cards','[name="text"]'),
      "time": $$q('add_cards','[name="time"]'),
      "level": $$q('add_cards','[name="level"]'),
      "qr": $$q('add_cards','[name="qr"]')
};

const cardLabels = {
    "type": $q('[data-card-type]'),
    "rounds": $q('[data-card-rounds]'),
    "exercise1": $qa('[data-card-exercise]')[0],
    "exercise2": $qa('[data-card-exercise]')[1],
    "exercise3": $qa('[data-card-exercise]')[2],
    "exercise4": $qa('[data-card-exercise]')[3],
    "hashtag": $q('[data-card-hashtag]')
    // "text": $q('[data-card-type]')),
    // "time": $q('[data-card-type]'),
    // "level": $q('[data-card-type]')),
    // "qr": $q('[data-card-type]')
};


  

//   const cardTypeInput = $$q('add_cards','[name="type"]');
  const cardTypeInput = cardInputs.type;
  const cardTypeLabel = $q('[data-card-type]');

  
  cardTypeInput.addEventListener('input', () => {
      cardTypeLabel.setAttribute('data-card-duration', cardTypeInput.value);
      cardTypeLabel.innerText = cardTypeLabel.getAttribute('data-card-duration').toUpperCase();
      if (cardTypeInput.value.length === 0) cardTypeLabel.innerText ='Empty';
  });


// })();