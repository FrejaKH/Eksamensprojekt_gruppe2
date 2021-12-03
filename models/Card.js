'use strict';

class Card {
    constructor(name, difficulty, video_url, type, category) {
        this.name = name,
        this.difficulty = difficulty,
        this.video_url = video_url,
        this.type = type, /*of type object (amrap, workandrest, repsandrounds*/
        this.category = category;
    }
}
module.exports = {
    Card: Card
};
