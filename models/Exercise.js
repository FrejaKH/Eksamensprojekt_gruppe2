"use strict";

module.exports = class Exercise {
  constructor(id, name) {
    (this.id = id),
      (this.name = name);
  }

  toString() {
    return `<option value="${this.id}">${this.name}</option>`;
  }
};
