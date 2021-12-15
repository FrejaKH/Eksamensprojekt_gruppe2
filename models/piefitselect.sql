-- all cards of type workandrest
SELECT c.name,
    c.difficulty,
    c.video_url,
    wr.rounds,
    wr.timeactive,
    wr.timerest
from card c
    LEFT JOIN workandrest wr ON c.card_id = wr.card_id
WHERE c.card_id = wr.card_id;
-- single card of type workandrest
SELECT c.name,
    c.difficulty,
    c.video_url,
    wr.rounds,
    wr.timeactive,
    wr.timerest
from card c
    LEFT JOIN workandrest wr ON c.card_id = wr.card_id
WHERE c.card_id = 1;
-- single card of type repsandrounds
SELECT c.name,
    c.difficulty,
    c.video_url,
    c.type,
    rar.rounds,
    rar.repsandrounds_id
from card c
    LEFT JOIN repsandrounds rar ON c.card_id = rar.card_id
WHERE c.card_id = 5;
-- exercises of single card of type repsandrounds
SELECT e.name,
    rare.reps
from exercise e
    LEFT JOIN repsandrounds_exercise rare ON rare.exercise_id = e.exercise_id
WHERE rare.repsandrounds_id = 1;
-- card of type repsandrounds, with exercises and reps. (HOWEVER, doens't return the rows in insertion order. 
--Maybe there must be an extra column on repsandrounds_exercise table stating the order.)
SELECT c.name,
    c.difficulty,
    c.video_url,
    c.type,
    rar.rounds,
    rar.repsandrounds_id,
    e.name,
    rare.reps
from card c
    INNER JOIN repsandrounds rar ON c.card_id = rar.card_id
    INNER JOIN repsandrounds_exercise rare ON rar.repsandrounds_id = rare.repsandrounds_id
    INNER JOIN exercise e ON rare.exercise_id = e.exercise_id
WHERE c.name = "#PiefitOttawa"
ORDER BY rar.repsandrounds_id DESC;
-- card of type repsandrounds, with exercises and reps, Now in order by a NEW ordernumber column in repsandrounds_exercise table. 
SELECT c.name,
    c.difficulty,
    c.video_url,
    c.type,
    rar.rounds,
    rar.repsandrounds_id,
    e.name,
    rare.reps
from card c
    INNER JOIN repsandrounds rar ON c.card_id = rar.card_id
    INNER JOIN repsandrounds_exercise rare ON rar.repsandrounds_id = rare.repsandrounds_id
    INNER JOIN exercise e ON rare.exercise_id = e.exercise_id
WHERE c.name = "#PiefitOttawa"
ORDER BY rare.ordernumber ASC;
-- card of type repsandrounds, with benchmark
SELECT c.name,
    c.type,
    b.level,
    rarb.time
from card c
    INNER JOIN repsandrounds rar ON c.card_id = rar.card_id
    INNER JOIN repsandrounds_benchmark rarb ON rar.repsandrounds_id = rarb.repsandrounds_id
    INNER JOIN benchmark b ON rarb.benchmark_id = b.benchmark_id
WHERE c.name = "#PiefitOttawa"
ORDER BY rarb.time DESC;
-- All cards of type repsandrounds, with benchmark
SELECT c.name,
    c.type,
    b.level,
    rarb.time
from card c
    INNER JOIN repsandrounds rar ON c.card_id = rar.card_id
    INNER JOIN repsandrounds_benchmark rarb ON rar.repsandrounds_id = rarb.repsandrounds_id
    INNER JOIN benchmark b ON rarb.benchmark_id = b.benchmark_id
WHERE c.type = "repsandrounds"
ORDER BY c.card_id ASC,
    rarb.time DESC;
-- All cards of type amrap, with benchmark
SELECT c.name,
    c.type,
    b.benchmark_id as "#",
    b.level,
    ab.rounds
from card c
    INNER JOIN amrap a ON c.card_id = a.card_id
    INNER JOIN amrap_benchmark ab ON a.amrap_id = ab.amrap_id
    INNER JOIN benchmark b ON ab.benchmark_id = b.benchmark_id
WHERE c.type = "amrap"
ORDER BY c.card_id ASC,
    ab.rounds ASC;
-- All exercises, to be able to reference them, when making new cards.
SELECT *
from exercise;
--try update on martin 
UPDATE user u SET
u.firstname = "martin spasmager",
u.lastname = "fjollesen",
u.phonenumber = 12345678
WHERE u.email = 'martin@piefitcards.dk';