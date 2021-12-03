-- all cards of type workandrest
SELECT c.name, c.difficulty, c.video_url, wr.rounds, wr.timeactive, wr.timerest from card c 
LEFT JOIN workandrest wr ON c.card_id = wr.card_id
WHERE c.card_id = wr.card_id;

-- single card of type workandrest
SELECT c.name, c.difficulty, c.video_url, wr.rounds, wr.timeactive, wr.timerest from card c 
LEFT JOIN workandrest wr ON c.card_id = wr.card_id
WHERE c.card_id = 1;