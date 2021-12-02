-- Theme table
INSERT INTO theme (name)
VALUES ('light'), ('dark');

-- User table
INSERT INTO user (email, firstname, lastname, phonenumber, password, isadmin, theme_id)
VALUES ('martin@piefitcards.dk', 'martin kidmose', 'kvist', 93947763, '21232F297A57A5A743894A0E4A801FC3', true, 1);

-- category table
INSERT INTO category (name)
VALUES 
('core'),
('lowerbody'),
('upperbody'),
('fullbody'),
('cardio')
;

-- card table
INSERT INTO card (name, difficulty, video_url, type, category_id) 
VALUES
('#PiefitWashingtonDC',	1, 'https://piefitcards.dk/wp-content/uploads/2021/11/PiefitWashingtonDC.mov',		'workandrest',	1),
('#PiefitSantiago',	2,	'https://piefitcards.dk',	'workandrest',	1),
('#PiefitPortofSpain',	3,	'https://piefitcards.dk',	'workandrest',	1),
('#PiefitParamaribo',	4,	'https://piefitcards.dk',	'workandrest',	1),
('#PiefitSanJose',	2,	'https://piefitcards.dk',	'repsandrounds',	1),
('#PiefitOttawa',	2,	'https://piefitcards.dk',	'repsandrounds',	1),
('#PiefitBogota',	4,	'https://piefitcards.dk',	'repsandrounds',	1),
('#PiefitHavana',	2,	'https://piefitcards.dk',	'amrap',	1),
('#PiefitNassau',	3,	'https://piefitcards.dk',	'amrap',	1),
('#PiefitBrasilia',	4,	'https://piefitcards.dk',	'amrap',	1),
('#PiefitBangkok',	1,	'https://piefitcards.dk',	'workandrest',	2),
('#PiefitShanghai',	2,	'https://piefitcards.dk',	'workandrest',	2),
('#PiefitManama',	3,	'https://piefitcards.dk',	'workandrest',	2),
('#PiefitBaghdad',	4,	'https://piefitcards.dk',	'workandrest',	2),
('#PiefitTokyo',	3,	'https://piefitcards.dk',	'repsandrounds',	2),
('#PiefitSeoul',	2,	'https://piefitcards.dk',	'repsandrounds',	2),
('#PiefitThimphu',	4,	'https://piefitcards.dk',	'repsandrounds',	2),
('#PiefitBeijing',	3,	'https://piefitcards.dk',	'amrap',	2),
('#PiefitJakarta',	3,	'https://piefitcards.dk',	'amrap',	2),
("#PiefitSana'a",	5,	'https://piefitcards.dk',	'amrap',	2),
('#PiefitCopenhagen',	1,	'https://piefitcards.dk',	'workandrest',	3),
('#PiefitOslo',	2,	'https://piefitcards.dk',	'workandrest',	3),
('#PiefitNuuk',	3,	'https://piefitcards.dk',	'workandrest',	3),
('#PiefitBudapest',	3,	'https://piefitcards.dk',	'workandrest',	3),
('#PiefitStockholm',	2,	'https://piefitcards.dk',	'repsandrounds',	3),
('#PiefitHelsinki',	2,	'https://piefitcards.dk',	'repsandrounds',	3),
('#PiefitBucharest',	4,	'https://piefitcards.dk',	'repsandrounds',	3),
('#PiefitBrussels',	3,	'https://piefitcards.dk',	'amrap',	3),
('#PiefitAmsterdam',	3,	'https://piefitcards.dk',	'amrap',	3),
('#PiefitPristina',	5,	'https://piefitcards.dk',	'amrap',	3),
('#PiefitDenmark',	1,	'https://piefitcards.dk',	'workandrest',	4),
('#PiefitNorway',	2,	'https://piefitcards.dk',	'workandrest',	4),
('#PiefitVenezuela',	3,	'https://piefitcards.dk',	'workandrest',	4),
('#PiefitGuyana',	4,	'https://piefitcards.dk',	'workandrest',	4),
('#PiefitSweden',	2,	'https://piefitcards.dk',	'repsandrounds',	4),
('#PiefitFinland',	2,	'https://piefitcards.dk',	'repsandrounds',	4),
('#PiefitSuriname',	3,	'https://piefitcards.dk',	'repsandrounds',	4),
('#PiefitBelgium',	3,	'https://piefitcards.dk',	'amrap',	4),
('#PiefitNetherlands',	3,	'https://piefitcards.dk',	'amrap',	4),
('#PiefitSerbia',	4,	'https://piefitcards.dk',	'amrap',	4)
;

-- statistic table
INSERT INTO statistic (date_completed, time_used, card_id)
VALUES
('2021-12-02', '00:07:00', 1)
;

-- user_statistic table
INSERT INTO user_statistic (statistic_id, email)
VALUES
(1, 'martin@piefitcards.dk')
;

-- boxcollection table
INSERT INTO boxcollection (name, description, description_long, releasedate, price)
VALUES
('PIEFITCARDS BOX – HOME EDITION V.1',	"Vores Home edition passer til begyndere og let øvet – men alle kan få gavn af træninger.", "Med en Home edition får/kan du:

40 stk. unikke, sjove kort, træn hele kroppen, uden udstyr, når som helst og hvor som helst

Forbrænde en masse kalorier og gå ned i vægt – Se forskellen i spejlet, på tøjet og dit syn på livet

Komme i bedre form, mærk dit helbred og kondi blive bedre – aldrig har det været nemmere

Få mere energi i hverdagen, bedre trivsel og øg din produktivitet – jobbet og dagens udfordinger bliver mere overskuelige

PiefitCards box V.1 er træninger lige ved hånden – aldrig mere skal du være frustreret over at planlægge din træning. Træk et kort, træn og mærk forskellen på krop og sjæl

10 fullbody, 10 uppebody, 10 lowerbody og 10 core træninger er inkluderet",	'2021-11-22',	299.00),
('PIEFITCARDS BOX – HIIT EDITION V.1',  'Her skal der være en description',	'lang beskrivelse', '2021-11-22',	299.00),
('PIEFITCARDS BOX – POWER EDITION V.1', 'Her skal der være en description', 'lang beskrivelse', '2021-11-22',	299.00)
;

-- cardcollection table
INSERT INTO cardcollection (name, description, releasedate, price, boxcollection_id)
VALUES
('PIEFITCARDS PACK – CORE HOME EDITION V.1',	'Her skal der være en description',	'2021-11-22',	99.00,	1),
('PIEFITCARDS PACK – LOWERBODY HOME EDITION V.1',	'Her skal der være en description',	'2021-11-22',	99.00,	1),
('PIEFITCARDS PACK – UPPERBODY HOME EDITION V.1',	'Her skal der være en description',	'2021-11-22',	99.00,	1),
('PIEFITCARDS PACK – FULLBODY HOME EDITION V.1',	'Her skal der være en description',	'2021-11-22',	99.00,	1)
;

-- cardcollection_card table
INSERT INTO cardcollection_card (cardcollection_id, card_id)
VALUES
(1,	1), (1,	2),(1,	3),(1,	4),(1,	5),(1,	6),(1,	7),(1,	8),(1,	9),(1,	10),
(2,	11),(2,	12),(2,	13),(2,	14),(2,	15),(2,	16),(2,	17),(2,	18),(2,	19),(2,	20),
(3,	21),(3,	22),(3,	23),(3,	24),(3,	25),(3,	26),(3,	27),(3,	28),(3,	29),(3,	30),
(4,	31),(4,	32),(4,	33),(4,	34),(4,	35),(4,	36),(4,	37),(4,	38),(4,	39),(4,	40)
;

-- user_cardcollection table
INSERT INTO user_cardcollection (email, cardcollection_id)
VALUES
('martin@piefitcards.dk',	1),
('martin@piefitcards.dk',	2),
('martin@piefitcards.dk',	3),
('martin@piefitcards.dk',	4)
;

-- exercise table
INSERT INTO exercise (name)
VALUES
('1/2 burpee'), ('3 v up'), ('air squat'), ('air thruster'), ('back cross lunge'), ('back extension'), ('bicycle'), ('big jack'), ('burpee'), ('burpee jack'), 
('burpee squat'), ('butt kick'), ('butt up'), ('cross 2 feet'), ('diamond push up'), ('diamond push up*'), ('double squat'), ('fast feet '), ('fast feet steps'), ('flutter kick'), 
('front jack'), ('full sit up'), ('glute bridge'), ('glute kick (e)'), ('heel touch'), ('heel touch (e)'), ('high block'), ('high knee'), ('isometric squat'), ('jump squat'), 
('jump squat*'), ('jumping jack'), ('jumping lunge*'), ('knee 2 elbow'), ('lateral jump'), ('leg raise'), ('lunge'), ('military drill'), ('mt. climber'),('narrow push up*'), 
('one leg glute bridge (e)'), ('over knee reach'), ('plank'), ('plank hip dip'), ('plank knee check'), ('plank knee check*'), ('plank toe tap'), ('plank walk*'), ('pogo jump'), ('power jack'), 
('prisoner squat pull'), ('prisoner squat twist'), ('push up hand release*'), ('push up knee check*'), ('push up*'), ('reverse crunch'), ('reverse lunge'), ('reverse lunge (e)'), ('rocket crunch'), ('running man'), 
('russian sit up'), ('russian twist (e)'), ('scissors'), ('shoulder tap'), ('shoulder tap (e)'), ('side lunge'), ('side plank (l)'), ('side plank (r)'), ('side triceps push up (e)'), ('side v up (l)'), 
('side v up (r)'), ('single leg v up (e)'), ('sit out'), ('sit up get up*'), ('sit up twist'), ('skaters run'), ('soviet kick'), ('spider push up*'), ('sprint'), ('sprint steps'), 
('squat 180*'), ("squat back'n forth"), ('squat bounce'), ('squat kick'), ('sumo squat'), ('superman'), ('superman y+t'), ('t push up'), ('t push up*'), ('toe touch'), 
('triceps push up*'), ('tuck jump'), ('tuck jump*'), ('twist'), ('v up*'), ('walk out'), ('walking push up*'), ('wide push up*'), ('windshield wiper*'), ('wiper crunch')
;

-- benchmark table
INSERT INTO benchmark (level)
VALUES 
('beginner'), ('intermediate'), ('advanced'), ('elite')
;

-- workandrest table
INSERT INTO workandrest (timeactive, timerest, rounds, card_id)
VALUES
('00:00:25',	'00:00:10',	3,	1),
('00:00:30',	'00:00:10',	3,	2),
('00:00:45',	'00:00:15',	3,	3),
('00:00:20',	'00:00:05',	4,	4),
('00:00:25',	'00:00:10',	3,	11),
('00:00:30',	'00:00:10',	3,	12),
('00:00:45',	'00:00:15',	3,	13),
('00:00:20',	'00:00:05',	4,	14),
('00:00:25',	'00:00:10',	3,	21),
('00:00:30',	'00:00:10',	3,	22),
('00:00:45',	'00:00:15',	3,	23),
('00:00:20',	'00:00:05',	4,	24),
('00:00:25',	'00:00:10',	3,	31),
('00:00:30',	'00:00:10',	3,	32),
('00:00:45',	'00:00:15',	3,	33),
('00:00:20',	'00:00:05',	4,	34)
;

-- workandrest_exercise table
INSERT INTO workandrest_exercise (workandrest_id, exercise_id)
VALUES
(1, 12), (1, 64), (1, 57), (1, 96), (2, 60), (2, 67), (2, 68), (2, 63), (3, 18), (3, 75), (3, 6), (3, 20), (4, 94),  (4, 27), (4, 73), (4, 39), (4, 86), (4, 34), 
(5, 79), (5, 29), (5, 43), (5, 23), (6, 35), (6, 17), (6, 99), (6, 37), (7, 50), (7, 2), (7, 84), (7, 57), (8, 11), (8, 48), (8, 20), (8, 29), (8, 5), (8, 34), 
(9, 18), (9, 90), (9, 8), (9, 20), (10, 32), (10, 44), (10, 97), (10, 96), (11, 76), (11, 87), (11, 70), (11, 71), (11, 53), (11, 50), (12, 34), (12, 96), (12, 40), (12, 12),
(13, 32), (13, 3), (13, 31), (13, 22), (14, 28), (14, 37), (14, 16), (14, 36), (15, 18), (15, 17), (15, 78), (15, 59), (16, 79), (16, 51), (16, 67), (16, 68), (16, 1), (16, 42);

-- repsandrounds table
INSERT INTO repsandrounds (rounds, card_id)
VALUES
(4,	5),
(4,	6),
(4,	7),
(4,	15),
(4,	16),
(4,	17),
(4,	25),
(4,	26),
(4,	27),
(4,	35),
(4,	36),
(4,	37)
;

-- repsandrounds_exercise table
INSERT INTO repsandrounds_exercise (repsandrounds_id, exercise_id, reps)
VALUES
(1, 8, 15), (1, 70, 10), (1, 71, 10), (1, 1, 10), (2, 77, 20), (2, 62, 10), (2, 20, 20), (2, 26, 10), (3, 38, 10), (3, 59, 14), (3, 100, 14), (3, 6, 12), (3, 36, 12), (3, 45, 10),
(4, 50, 15), (4, 77, 16), (4, 59, 17), (4, 57, 18), (5, 31, 10), (5, 1, 10), (5, 51, 10), (5, 42, 20), (6, 52, 12),  (6, 66, 12), (6, 24, 12), (6, 32, 20), (6, 47, 12), (6, 99, 12),
(7, 34, 30), (7, 96, 10), (7, 40, 10), (7, 13, 10), (8, 73, 16), (8, 69, 8), (8, 72, 8), (8, 21, 16), (9, 97, 8), (9, 10, 10), (9, 15, 12), (9, 59, 14), (9, 14, 20), (9, 90, 14), 
(10, 14, 30), (10, 84, 12), (10, 39, 30), (10, 6, 12), (11, 12, 30), (11, 81, 10), (11, 9, 10), (11, 42, 15), (12, 27, 15), (12, 98, 10), (12, 94, 20), (12, 25, 20), (12, 4, 15), (12, 6, 15)
;
-- repsandrounds_benchmark table
INSERT INTO repsandrounds_benchmark (repsandrounds_id, benchmark_id, time)
VALUES
(1, 1, '00:12:00'), (1, 2, '00:10:00'), (1, 3, '00:09:00'), (1, 4, '00:08:00'),
(2, 2, '00:10:00'), (2, 1, '00:12:00'), (2, 3, '00:09:00'), (2, 4, '00:08:00'),
(3, 1, '00:18:00'), (3, 2, '00:15:00'), (3, 3, '00:13:00'), (3, 4, '00:12:00'),
(4, 1, '00:12:00'), (4, 2, '00:10:00'), (4, 3, '00:09:00'), (4, 4, '00:08:00'),
(5, 1, '00:12:00'), (5, 2, '00:10:00'), (5, 3, '00:09:00'), (5, 4, '00:08:00'),
(6, 1, '00:19:00'), (6, 2, '00:18:00'), (6, 3, '00:16:00'), (6, 4, '00:15:00'),
(7, 1, '00:12:00'), (7, 2, '00:10:00'), (7, 3, '00:09:00'), (7, 4, '00:08:00'),
(8, 1, '00:12:00'), (8, 2, '00:10:00'), (8, 3, '00:09:00'), (8, 4, '00:08:00'),
(9, 1, '00:18:00'), (9, 2, '00:17:00'), (9, 3, '00:15:00'), (9, 4, '00:14:00'),
(10, 1, '00:12:00'), (10, 2, '00:10:00'), (10, 3, '00:09:00'), (10, 4, '00:08:00'),
(11, 1, '00:12:00'), (11, 2, '00:10:00'), (11, 3, '00:09:00'), (11, 4, '00:08:00'),
(12, 1, '00:16:00'), (12, 2, '00:15:00'), (12, 3, '00:13:00'), (12, 4, '00:12:00')
;

-- amrap table
INSERT INTO amrap (time, card_id)
VALUES
('00:14:00',	8),
('00:12:00',	9),
('00:16:00',	10),
('00:14:00',	18),
('00:12:00',	19),
('00:18:00',	20),
('00:14:00',	28),
('00:12:00',	29),
('00:16:00',	30),
('00:14:00',	38),
('00:12:00',	39),
('00:13:00',	40)
;

-- amrap_exercise table
INSERT INTO amrap_exercise (amrap_id, exercise_id, reps)
VALUES
(1, 47, 10), (1, 13, 15), (1, 7, 20), (1, 80, 50),
(2, 19, 30), (2, 44, 10), (2, 74, 10), (2, 99, 10),
(3, 93, 12), (3, 61, 12), (3, 13, 12), (3, 77, 16), (3, 63, 16), (3, 65, 16),
(4, 11, 10), (4, 18, 30), (4, 41, 10), (4, 36, 10),
(5, 17, 10), (5, 50, 12), (5, 58, 10), (5, 95, 10),
(6, 33, 10), (6, 83, 10), (6, 9, 10), (6, 56, 10), (6, 30, 10), (6, 39, 40),
(7, 39, 30), (7, 74, 10), (7, 63, 20), (7, 6, 15),
(8, 9, 10), (8, 7, 15), (8, 46, 10), (8, 91, 10),
(9, 93, 10), (9, 88, 10), (9, 74, 10), (9, 6, 10), (9, 38, 10), (9, 36, 10),
(10, 35, 30), (10, 83, 12), (10, 1, 12), (10, 48, 12),
(11, 60, 30), (11, 85, 10), (11, 38, 8), (11, 90, 12),
(12, 77, 20), (12, 82, 12), (12, 54, 12), (12, 13, 12), (12, 14, 20), (12, 73, 20)
;

-- amrap_benchmark table 
INSERT INTO amrap_benchmark (amrap_id, benchmark_id, rounds)
VALUES
(1, 1, 4), (1, 2, 5), (1, 3, 6), (1, 4, 8),
(2, 1, 3), (2, 2, 4), (2, 3, 5), (2, 4, 6),
(3, 1, 3), (3, 2, 4), (3, 3, 5), (3, 4, 6),
(4, 1, 3), (4, 2, 5), (4, 3, 6), (4, 4, 7),
(5, 1, 3), (5, 2, 4), (5, 3, 5), (5, 4, 6),
(6, 1, 3), (6, 2, 4), (6, 3, 5), (6, 4, 6),
(7, 1, 3), (7, 2, 5), (7, 3, 6), (7, 4, 7),
(8, 1, 3), (8, 2, 4), (8, 3, 5), (8, 4, 6),
(9, 1, 2), (9, 2, 3), (9, 3, 4), (9, 4, 5),
(10, 1, 3), (10, 2, 5), (10, 3, 7), (10, 4, 9),
(11, 1, 4), (11, 2, 5), (11, 3, 6), (11, 4, 7),
(12, 1, 3), (12, 2, 5), (12, 3, 6), (12, 4, 7)
;
