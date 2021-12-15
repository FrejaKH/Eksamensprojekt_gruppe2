/*

We want to create a new card with name #PiefitMyCard.
(1) It should be of type Reps/Rounds, and have 8 rounds.
(2) It should have the following exercises and reps: Jump Squat (8), Lateral Jump (8), Jumping Jack (8), Sprint Steps (32).
(3) It should be benchmarked with time from beginner to expert: 30min, 20min, 15min, 10min.

*/



/*----------INSERTS-----------*/

-- Create New Card
INSERT INTO card (name, difficulty, video_url, type, category_id) 
VALUES
('#PiefitMyCard',	5,	'https://piefitcards.dk', 'repsandrounds',	1);

INSERT INTO repsandrounds (rounds, card_id)
SELECT 8, card_id from card where card.name ='#PiefitMyCard';

-- check new card of type repsandrounds
SELECT c.card_id, c.name, c.difficulty, c.video_url, c.type, rar.rounds, rar.repsandrounds_id from card c 
LEFT JOIN repsandrounds rar ON c.card_id = rar.card_id
WHERE c.name = '#PiefitMyCard';

/*
insert exercises to the new card, only by knowing the name of the card. 
We need the repsandrounds_id, based on the card_id. 
Therefore we use a select statement. Other new values is just put after the commas.*/
INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps, ordernumber)
SELECT rar.repsandrounds_id, 30, 8, 1
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';

--!! This cannot be done. These type of inserts must be done seperately, as for example a loop. 
/*
INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps, ordernumber)
(SELECT rar.repsandrounds_id, 35, 5, 2 from repsandrounds rar LEFT JOIN card c ON rar.card_id = c.card_id WHERE c.name = '#PiefitMyCard'), 
(SELECT rar.repsandrounds_id, 2, 20, 3 from repsandrounds rar LEFT JOIN card c ON rar.card_id = c.card_id WHERE c.name = '#PiefitMyCard'), 
(SELECT rar.repsandrounds_id, 99, 10, 4 from repsandrounds rar LEFT JOIN card c ON rar.card_id = c.card_id WHERE c.name = '#PiefitMyCard')
;
*/

-- insert rest of the exercises to the new card, like tried above.
INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps, ordernumber)
SELECT rar.repsandrounds_id, 35, 8, 2
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';
INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps, ordernumber)
SELECT rar.repsandrounds_id, 32, 8, 3
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';
INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps, ordernumber)
SELECT rar.repsandrounds_id, 80, 32, 4
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';

-- Insert to benchmark
INSERT INTO repsandrounds_benchmark (repsandrounds_id, benchmark_id, time)
SELECT rar.repsandrounds_id, 1, '00:30:00'
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';
INSERT INTO repsandrounds_benchmark (repsandrounds_id, benchmark_id, time)
SELECT rar.repsandrounds_id, 2, '00:20:00'
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';
INSERT INTO repsandrounds_benchmark (repsandrounds_id, benchmark_id, time)
SELECT rar.repsandrounds_id, 3, '00:15:00'
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';
INSERT INTO repsandrounds_benchmark (repsandrounds_id, benchmark_id, time)
SELECT rar.repsandrounds_id, 4, '00:10:00'
FROM repsandrounds rar 
LEFT JOIN card c ON rar.card_id = c.card_id 
WHERE c.name = '#PiefitMyCard';

--
--SELECTS
--

-- Select the card.
SELECT c.name, c.difficulty, c.video_url, c.type, rar.rounds, rar.repsandrounds_id, e.name, rare.reps 
from card c
INNER JOIN repsandrounds rar ON c.card_id = rar.card_id
INNER JOIN repsandrounds_exercise rare ON rar.repsandrounds_id = rare.repsandrounds_id
INNER JOIN exercise e ON rare.exercise_id = e.exercise_id 
WHERE c.name = "#PiefitMyCard"
ORDER BY rare.ordernumber ASC; 

-- Select the benchmark
SELECT c.name, c.type, b.level, rarb.time 
from card c 
INNER JOIN repsandrounds rar ON c.card_id = rar.card_id 
INNER JOIN repsandrounds_benchmark rarb ON rar.repsandrounds_id = rarb.repsandrounds_id
INNER JOIN benchmark b ON rarb.benchmark_id = b.benchmark_id
WHERE c.name = "#PiefitMyCard"
ORDER BY rarb.time DESC;
