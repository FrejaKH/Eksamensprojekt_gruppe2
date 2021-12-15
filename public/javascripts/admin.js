import { createMenu } from "./makemenu.js";

const initialize = function () {
  createMenu("menu");

};

window.addEventListener("load", initialize);

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

(() => {
  //Key Value pair of input fields
  const cardInputs = {
    type: $$q("add_cards", '[name="type"]'),
    rounds: $$q("add_cards", '[name="rounds"]'),
    duration: $$q("add_cards", '[name="duration"]'),
    exercises: [
      $$q("add_cards", '[name="exercise1"]'),
      $$q("add_cards", '[name="exercise2"]'),
      $$q("add_cards", '[name="exercise3"]'),
      $$q("add_cards", '[name="exercise4"]'),
    ],
    reps: [
       $$q("add_cards", '[name="reps1"]'),
       $$q("add_cards", '[name="reps2"]'),
       $$q("add_cards", '[name="reps3"]'),
       $$q("add_cards", '[name="reps4"]'),
    ],
    hashtag: $$q("add_cards", '[name="hashtag"]'),
    text: $$q("add_cards", '[name="text"]'),
    time: $$q("add_cards", '[name="time"]'),
    // level: $$q('add_cards','[name="level"]'),
    // qr: $$q('add_cards','[name="qr"]')
  };

  //Key Value pair of labels
  const cardLabels = {
    type: $q("[data-card-type]"),
    rounds: $q("[data-card-rounds]"),
    duration: $q("[data-card-duration]"),
    exercises: [
      $qa("[data-card-exercise]")[0],
      $qa("[data-card-exercise]")[1],
      $qa("[data-card-exercise]")[2],
      $qa("[data-card-exercise]")[3],
    ],
    reps: [
      $qa("[data-card-reps]")[0],
      $qa("[data-card-reps]")[1],
      $qa("[data-card-reps]")[2],
      $qa("[data-card-reps]")[3],
    ],
    hashtag: $q("[data-card-hashtag]"),
    text: $q("[data-card-text]"),
    time: $q("[data-card-time]"),
    // level: $q('[data-card-level]')),
    // qr: $q('[data-card-qr]')
  };

  const cardTypeInput = cardInputs.type;
  const cardTypeLabel = cardLabels.type;

  //Create datalist element for exercise data
  const exerciseDataList = document.createElement("datalist");
  exerciseDataList.setAttribute("id", "datalist-exercises");
  let option = document.createElement("option");

  //Initializing exercise input from database
  // let dataList = [];
  // dataList = exerciseList;
  // dataList.forEach(element, i => {
  //   option.value = element[i].name;
  //   exerciseDataList.appendChild(option);
  // });
  // $('exercises').append(exerciseDataList);

  //Initializing exercise input from database HACK
 
  // const populateList = async function () {
  //   let r = await models.listExercises();
  //   let exerciseList = [];
  //   r.forEach(element, (i) => {
  //     let exercise = new Exercise(r[i].id, r[i].name);
  //     exerciseList.push(exercise);
  //   });
  //   exerciseList.sort((a, b) => a.id - b.id);

  //   let dataList = [];
  //   dataList = exerciseList;
  //   dataList.forEach(element, (i) => {
  //     option.value = element[i].name;
  //     exerciseDataList.appendChild(option);
  //   });
  //   $("exercises").append(exerciseDataList);
  // };

  //Initializing exercise input from code
  for (let i = 0; i < 10; i++) {
    option.value = "Tuck Jumps";
    exerciseDataList.appendChild(option);
  }
  $('exercises').append(exerciseDataList);

  //Insert exercise list to inputs
  cardInputs.exercises.forEach((item, i) => {
    item.setAttribute("list", "exercise-list");
  });

  //Eventlistener on text change in "Type"
  cardInputs.type.addEventListener("input", () => {
    cardLabels.type.setAttribute(
      "data-card-type",
      cardInputs.type.options[cardInputs.type.selectedIndex].text
    );
    cardLabels.type.innerText = cardLabels.type
      .getAttribute("data-card-type")
      .toUpperCase();
    if (cardInputs.type.value.length === 0) cardLabels.type.innerText = "Empty";
  });
    //Eventlistener on text change in "Rounds"
    cardInputs.rounds.addEventListener("input", () => {
      cardLabels.rounds.setAttribute("data-card-rounds", cardInputs.rounds.value);
    cardLabels.rounds.innerText =
      cardLabels.rounds.getAttribute("data-card-rounds").toUpperCase() +
      " ROUNDS";
    if (cardInputs.rounds.value === "1")
      cardLabels.rounds.innerText = "1 ROUND";
    if (cardInputs.rounds.value.length === 0)
      cardLabels.rounds.innerText = "1 ROUND";
    });

      //Eventlistener on text change in "Time/Reps"
  cardInputs.duration.addEventListener("input", () => {
    cardLabels.duration.setAttribute(
      "data-card-duration",
      cardInputs.duration.value
    );
    cardLabels.duration.innerText = cardLabels.duration
      .getAttribute("data-card-duration")
      .toUpperCase();
    if (cardInputs.duration.value.length === 0)
      cardLabels.duration.innerText = "---";
  });

    //Eventlistener on text change in "Hashtag"
    cardInputs.hashtag.addEventListener("input", () => {
    cardLabels.hashtag.setAttribute(
      "data-card-hashtag",
      cardInputs.hashtag.value
    );
    cardLabels.hashtag.innerText = `#Piefit${cardLabels.hashtag.getAttribute(
      "data-card-hashtag"
    )}`;
    if (cardInputs.hashtag.value.length === 0)
      cardLabels.hashtag.innerText = "#Piefit";
    });

  //Eventlistener on text change in "Exercises"

  cardInputs.exercises.forEach((item, i) => {
    item.addEventListener("input", () => {
      cardLabels.exercises[i].setAttribute("data-card-exercise", item.value);
      cardLabels.exercises[i].innerText = cardLabels.exercises[i]
        .getAttribute("data-card-exercise")
        .toUpperCase();
      if (item.value.length === 0) cardLabels.exercises[i].innerText = "Empty";
    });
  });

   //Eventlistener on text change in "Reps"

  cardInputs.reps.forEach((item, i) => {
    item.addEventListener("input", () => {
      cardLabels.reps[i].setAttribute("data-card-reps", item.value);
      cardLabels.reps[i].innerText = cardLabels.reps[i]
        .getAttribute("data-card-reps")
        .toUpperCase();
      if (item.value.length === 0) cardLabels.reps[i].innerText = "Empty";
    });
  });

    //Eventlistener on text change in "Time"

    cardInputs.time.addEventListener("input", () => {
      let timeText = cardInputs.time.value;
      // cardLabels.time.setAttribute("data-card-time", cardInputs.time.value);
      // cardLabels.time.innerText = cardLabels.time
      //   .getAttribute("data-card-time").toUpperCase();
      // if (cardInputs.time.value.length === 0) cardLabels.time.innerText = "00:00";
      if (cardInputs.type.value === "AMRAP") {
        cardLabels.type.innerText = "AMRAP " + timeText; 
      }
    });

      //Eventlistener on text change in "References"
  cardInputs.text.addEventListener("input", () => {
    cardLabels.text.setAttribute("data-card-text", cardInputs.text.value);
    cardLabels.text.innerText = cardLabels.text
      .getAttribute("data-card-text")
      .toUpperCase();
    if (cardInputs.text.value.length === 0) cardLabels.text.innerText = "Empty";
  });
})();
