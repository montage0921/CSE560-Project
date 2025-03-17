INSERT INTO TV_Movie (tconst, titleType, primaryTitle, originalTitle, isAdult, startYear, endYear, runtimeMinutes)
VALUES
('tt000001', 'movie',       'Primary Title 1',  'Original Title 1',  false, 2001,  NULL, 120),
('tt000002', 'short',       'Primary Title 2',  'Original Title 2',  false, 2002,  NULL,  90),
('tt000003', 'tvMovie',     'Primary Title 3',  'Original Title 3',  false, 2003,  NULL,  95),
('tt000004', 'tvSeries',    'Primary Title 4',  'Original Title 4',  false, 2004, 2012,  50),
('tt000005', 'tvMiniSeries','Primary Title 5',  'Original Title 5',  false, 2005, 2007,  45),
('tt000006', 'tvSpecial',   'Primary Title 6',  'Original Title 6',  false, 2006,  NULL,  70),
('tt000007', 'video',       'Primary Title 7',  'Original Title 7',  false, 2007,  NULL,  88),
('tt000008', 'videoGame',   'Primary Title 8',  'Original Title 8',  false, 2008,  NULL,  30),
('tt000009', 'tvPilot',     'Primary Title 9',  'Original Title 9',  false, 2009,  NULL,  60),
('tt000010', 'tvShort',     'Primary Title 10', 'Original Title 10', false, 2010,  NULL,  20),
('tt000011', 'tvSeries',    'Primary Title 11', 'Original Title 11', false, 2011, 2020,  55),
('tt000012', 'movie',       'Primary Title 12', 'Original Title 12', false, 2012,  NULL, 105),
('tt000013', 'short',       'Primary Title 13', 'Original Title 13', false, 2013,  NULL,  82),
('tt000014', 'tvMovie',     'Primary Title 14', 'Original Title 14', false, 2014,  NULL, 110),
('tt000015', 'tvSeries',    'Primary Title 15', 'Original Title 15', false, 2015, 2018,  44),
('tt000016', 'tvMiniSeries','Primary Title 16', 'Original Title 16', false, 2016, 2017,  42),
('tt000017', 'tvSpecial',   'Primary Title 17', 'Original Title 17', false, 2017,  NULL,  67),
('tt000018', 'video',       'Primary Title 18', 'Original Title 18', false, 2018,  NULL,  90),
('tt000019', 'videoGame',   'Primary Title 19', 'Original Title 19', false, 2019,  NULL,  25),
('tt000020', 'tvPilot',     'Primary Title 20', 'Original Title 20', false, 2020,  NULL,  65);


INSERT INTO Title_Aliases (titleId, "ordering", title, region, "language", isOriginalTitle)
VALUES
('tt000001', 1, 'Alt Title 1', 'US', 'en', true),
('tt000002', 1, 'Alt Title 2', 'US', 'en', true),
('tt000003', 1, 'Alt Title 3', 'FR', 'fr', false),
('tt000004', 1, 'Alt Title 4', 'GB', 'en', false),
('tt000005', 1, 'Alt Title 5', 'JP', 'ja', false),
('tt000006', 1, 'Alt Title 6', 'US', 'en', true),
('tt000007', 1, 'Alt Title 7', 'DE', 'de', false),
('tt000008', 1, 'Alt Title 8', 'CN', 'zh', false),
('tt000009', 1, 'Alt Title 9', 'IT', 'it', false),
('tt000010', 1, 'Alt Title 10','US', 'en', true),
('tt000011', 1, 'Alt Title 11','US', 'en', false),
('tt000012', 1, 'Alt Title 12','FR', 'fr', false),
('tt000013', 1, 'Alt Title 13','GB', 'en', false),
('tt000014', 1, 'Alt Title 14','US', 'en', true),
('tt000015', 1, 'Alt Title 15','JP', 'ja', false),
('tt000016', 1, 'Alt Title 16','DE', 'de', false),
('tt000017', 1, 'Alt Title 17','BR', 'pt', false),
('tt000018', 1, 'Alt Title 18','US', 'en', true),
('tt000019', 1, 'Alt Title 19','RU', 'ru', false),
('tt000020', 1, 'Alt Title 20','CN', 'zh', false);


INSERT INTO Genres (genre)
VALUES
('Action'),
('Comedy'),
('Drama'),
('Horror'),
('Sci-Fi'),
('Romance'),
('Thriller'),
('Animation'),
('Adventure'),
('Documentary'),
('Crime'),
('Fantasy'),
('Mystery'),
('Musical'),
('Western'),
('Biography'),
('Family'),
('Film-Noir'),
('Sport'),
('War');


INSERT INTO genres_movie (genreID, tconst)
VALUES
(1,  'tt000001'),
(2,  'tt000002'),
(3,  'tt000003'),
(4,  'tt000004'),
(5,  'tt000005'),
(6,  'tt000006'),
(7,  'tt000007'),
(8,  'tt000008'),
(9,  'tt000009'),
(10, 'tt000010'),
(11, 'tt000011'),
(12, 'tt000012'),
(13, 'tt000013'),
(14, 'tt000014'),
(15, 'tt000015'),
(16, 'tt000016'),
(17, 'tt000017'),
(18, 'tt000018'),
(19, 'tt000019'),
(20, 'tt000020');


INSERT INTO Episode (tconst, parentTconst, seasonNumber, episodeNumber)
VALUES
(1,  'tt000004',  1, 1),
(2,  'tt000004',  1, 2),
(3,  'tt000004',  1, 3),
(4,  'tt000005',  2, 1),
(5,  'tt000005',  2, 2),
(6,  'tt000011',  1, 1),
(7,  'tt000011',  2, 2),
(8,  'tt000011',  2, 3),
(9,  'tt000011',  3, 1),
(10, 'tt000015',  1, 1),
(11, 'tt000015',  1, 2),
(12, 'tt000015',  1, 3),
(13, 'tt000015',  2, 1),
(14, 'tt000016',  1, 1),
(15, 'tt000016',  1, 2),
(16, 'tt000016',  2, 1),
(17, 'tt000016',  2, 2),
(18, 'tt000016',  2, 3),
(19, 'tt000005',  3, 1),
(20, 'tt000004',  2, 4);


INSERT INTO Episode_Details (tconst, primaryTitle, originalTitle, startYear, runtimeMinutes)
VALUES
(1,  'Episode Title 1',  'Episode Original 1',   2010,  45),
(2,  'Episode Title 2',  'Episode Original 2',   2010,  45),
(3,  'Episode Title 3',  'Episode Original 3',   2010,  45),
(4,  'Episode Title 4',  'Episode Original 4',   2011,  46),
(5,  'Episode Title 5',  'Episode Original 5',   2011,  46),
(6,  'Episode Title 6',  'Episode Original 6',   2012,  47),
(7,  'Episode Title 7',  'Episode Original 7',   2012,  47),
(8,  'Episode Title 8',  'Episode Original 8',   2013,  48),
(9,  'Episode Title 9',  'Episode Original 9',   2013,  48),
(10, 'Episode Title 10', 'Episode Original 10',  2014,  50),
(11, 'Episode Title 11', 'Episode Original 11',  2014,  50),
(12, 'Episode Title 12', 'Episode Original 12',  2014,  50),
(13, 'Episode Title 13', 'Episode Original 13',  2015,  42),
(14, 'Episode Title 14', 'Episode Original 14',  2015,  42),
(15, 'Episode Title 15', 'Episode Original 15',  2016,  42),
(16, 'Episode Title 16', 'Episode Original 16',  2016,  42),
(17, 'Episode Title 17', 'Episode Original 17',  2016,  42),
(18, 'Episode Title 18', 'Episode Original 18',  2017,  42),
(19, 'Episode Title 19', 'Episode Original 19',  2017,  44),
(20, 'Episode Title 20', 'Episode Original 20',  2018,  45);


INSERT INTO Ratings (tconst, averageRating, numVotes)
VALUES
('tt000001',  5.5,  1000),
('tt000002',  6.2,   500),
('tt000003',  7.1,   750),
('tt000004',  8.3,  2000),
('tt000005',  7.7,  1500),
('tt000006',  6.9,   800),
('tt000007',  4.5,   200),
('tt000008',  8.0,  1234),
('tt000009',  6.0,   675),
('tt000010',  5.8,   400),
('tt000011',  8.5,  2100),
('tt000012',  7.2,   900),
('tt000013',  4.9,   100),
('tt000014',  6.7,   978),
('tt000015',  9.0,  5000),
('tt000016',  5.2,   750),
('tt000017',  6.3,   820),
('tt000018',  5.6,   321),
('tt000019',  8.1,   999),
('tt000020',  7.9,  1200);


INSERT INTO People (nconst, primaryName, birthYear, deathYear)
VALUES
('nm000001', 'Person 1',  1970, NULL),
('nm000002', 'Person 2',  1980, NULL),
('nm000003', 'Person 3',  1990, NULL),
('nm000004', 'Person 4',  1975, NULL),
('nm000005', 'Person 5',  1965, NULL),
('nm000006', 'Person 6',  2000, NULL),
('nm000007', 'Person 7',  1985, NULL),
('nm000008', 'Person 8',  1972, NULL),
('nm000009', 'Person 9',  1995, NULL),
('nm000010', 'Person 10', 1988, NULL),
('nm000011', 'Person 11', 1977, NULL),
('nm000012', 'Person 12', 1960, NULL),
('nm000013', 'Person 13', 1955, NULL),
('nm000014', 'Person 14', 1999, NULL),
('nm000015', 'Person 15', 1944, NULL),
('nm000016', 'Person 16', 1991, NULL),
('nm000017', 'Person 17', 1976, NULL),
('nm000018', 'Person 18', 1983, NULL),
('nm000019', 'Person 19', 1982, NULL),
('nm000020', 'Person 20', 1979, NULL);


INSERT INTO Job_Category (category, job)
VALUES
('Directing',  'Director1'),
('Writing',    'Writer1'),
('Producing',  'Producer1'),
('Acting',     'Actor1'),
('Cinematography', 'Cinematographer1'),
('Editing',    'Editor1'),
('Directing',  'Director2'),
('Writing',    'Writer2'),
('Producing',  'Producer2'),
('Acting',     'Actor2'),
('Acting',     'Actor3'),
('Editing',    'Editor2'),
('Production', 'ProductionMgr1'),
('Sound',      'SoundDesigner1'),
('Music',      'Composer1'),
('Art',        'ArtDirector1'),
('Costume',    'CostumeDesigner1'),
('VisualFX',   'VFXSupervisor1'),
('Casting',    'CastingDirector1'),
('Stunts',     'StuntCoordinator1');


INSERT INTO Job_People (tconst, nconst, job)
VALUES
('tt000001', 'nm000001', 'Director1'),
('tt000002', 'nm000002', 'Writer1'),
('tt000003', 'nm000003', 'Producer1'),
('tt000004', 'nm000004', 'Actor1'),
('tt000005', 'nm000005', 'Cinematographer1'),
('tt000006', 'nm000006', 'Editor1'),
('tt000007', 'nm000007', 'Director2'),
('tt000008', 'nm000008', 'Writer2'),
('tt000009', 'nm000009', 'Producer2'),
('tt000010', 'nm000010', 'Actor2'),
('tt000011', 'nm000011', 'Actor3'),
('tt000012', 'nm000012', 'Editor2'),
('tt000013', 'nm000013', 'ProductionMgr1'),
('tt000014', 'nm000014', 'SoundDesigner1'),
('tt000015', 'nm000015', 'Composer1'),
('tt000016', 'nm000016', 'ArtDirector1'),
('tt000017', 'nm000017', 'CostumeDesigner1'),
('tt000018', 'nm000018', 'VFXSupervisor1'),
('tt000019', 'nm000019', 'CastingDirector1'),
('tt000020', 'nm000020', 'StuntCoordinator1');


INSERT INTO Profession (profession_name)
VALUES
('Director'),
('Writer'),
('Producer'),
('Actor'),
('Editor'),
('Composer'),
('Cinematographer'),
('Production Manager'),
('Sound Designer'),
('VFX Supervisor'),
('Casting Director'),
('Stunt Coordinator'),
('Art Director'),
('Costume Designer'),
('Makeup Artist'),
('Animator'),
('Executive Producer'),
('Assistant Director'),
('Location Manager'),
('Boom Operator');


INSERT INTO Profession_People (profession_id, nconst)
VALUES
(1,  'nm000001'),
(2,  'nm000002'),
(3,  'nm000003'),
(4,  'nm000004'),
(5,  'nm000005'),
(6,  'nm000006'),
(7,  'nm000007'),
(8,  'nm000008'),
(9,  'nm000009'),
(10, 'nm000010'),
(11, 'nm000011'),
(12, 'nm000012'),
(13, 'nm000013'),
(14, 'nm000014'),
(15, 'nm000015'),
(16, 'nm000016'),
(17, 'nm000017'),
(18, 'nm000018'),
(19, 'nm000019'),
(20, 'nm000020');


INSERT INTO "Cast" (tconst, nconst)
VALUES
('tt000001', 'nm000004'),
('tt000002', 'nm000004'),
('tt000003', 'nm000009'),
('tt000004', 'nm000010'),
('tt000005', 'nm000011'),
('tt000006', 'nm000012'),
('tt000007', 'nm000013'),
('tt000008', 'nm000014'),
('tt000009', 'nm000015'),
('tt000010', 'nm000016'),
('tt000011', 'nm000017'),
('tt000012', 'nm000018'),
('tt000013', 'nm000019'),
('tt000014', 'nm000020'),
('tt000015', 'nm000001'),
('tt000016', 'nm000002'),
('tt000017', 'nm000003'),
('tt000018', 'nm000005'),
('tt000019', 'nm000006'),
('tt000020', 'nm000007');


INSERT INTO Famous_Work (tconst, nconst)
VALUES
('tt000001', 'nm000001'),
('tt000002', 'nm000002'),
('tt000003', 'nm000003'),
('tt000004', 'nm000004'),
('tt000005', 'nm000005'),
('tt000006', 'nm000006'),
('tt000007', 'nm000007'),
('tt000008', 'nm000008'),
('tt000009', 'nm000009'),
('tt000010', 'nm000010'),
('tt000011', 'nm000011'),
('tt000012', 'nm000012'),
('tt000013', 'nm000013'),
('tt000014', 'nm000014'),
('tt000015', 'nm000015'),
('tt000016', 'nm000016'),
('tt000017', 'nm000017'),
('tt000018', 'nm000018'),
('tt000019', 'nm000019'),
('tt000020', 'nm000020');
