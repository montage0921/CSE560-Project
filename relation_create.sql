-- Create TABLE: TV_Movie
CREATE TABLE TV_Movie(
	tconst VARCHAR(20) PRIMARY KEY NOT NULL,
	titleType VARCHAR(50) CHECK (titleType IN ('movie', 'short', 'tvMovie', 'tvSeries', 'tvMiniSeries', 'tvSpecial', 'video', 'videoGame','tvPilot','tvShort')), 
	primaryTitle VARCHAR(200) NOT NULL,
	originalTitle VARCHAR(200),
	isAdult BOOLEAN DEFAULT False,
	startYear INT,
	endYear INT,
	runtimeMinutes INT
);

-- Create TABLE: Title Aliases
CREATE TABLE Title_Aliases(
	titleId VARCHAR(20) NOT NULL,
	"ordering" INT NOT NULL,
	title VARCHAR(200) NOT NULL,
	region VARCHAR(20),
	"language" VARCHAR(20),
	isOriginalTitle BOOLEAN NOT NULL,
	PRIMARY KEY(titleId,"ordering"),
	FOREIGN KEY (titleId) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create TABLE: Genres
CREATE TABLE Genres (
    genreID SERIAL PRIMARY KEY,
    genre VARCHAR(20) NOT NULL UNIQUE
);

-- Create TABLE: genres_movie (Join TABLE for TV_Movie and Genres)
CREATE TABLE genres_movie (
    genreID INT NOT NULL,
    tconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (genreID, tconst),
    FOREIGN KEY (genreID) REFERENCES Genres(genreID) ON DELETE CASCADE,
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create TABLE: Episode
CREATE TABLE Episode (
    tconst VARCHAR(20) PRIMARY KEY NOT NULL,
    parentTconst VARCHAR(20) NOT NULL,
    seasonNumber INT,
    episodeNumber INT,
    FOREIGN KEY (parentTconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create TABLE: Episode Details
CREATE TABLE Episode_Details (
    tconst VARCHAR(20) PRIMARY KEY,
    primaryTitle VARCHAR(200) NOT NULL,
    originalTitle VARCHAR(200),
    startYear INT,
    runtimeMinutes INT,
    FOREIGN KEY (tconst) REFERENCES Episode(tconst) ON DELETE CASCADE
);

-- Create TABLE: Ratings
CREATE TABLE Ratings (
    tconst VARCHAR(20) PRIMARY KEY,
    averageRating FLOAT,
    numVotes INT NOT NULL,
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create TABLE: People
CREATE TABLE People (
    nconst VARCHAR(20) PRIMARY KEY,
    primaryName VARCHAR(200) NOT NULL,
    birthYear INT,
    deathYear INT
);

-- Create TABLE: Job Category
CREATE TABLE Job_Category (
    category VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL PRIMARY KEY
);

-- Create TABLE: Job People (Relationship between TV_Movie and People via Jobs)
CREATE TABLE Job_People (
    tconst VARCHAR(20) NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    job VARCHAR(50) NOT NULL,
    PRIMARY KEY (tconst, nconst,job),
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE,
    FOREIGN KEY (job) REFERENCES Job_Category(job) ON DELETE CASCADE
);

-- Create TABLE: Profession
CREATE TABLE Profession (
    profession_id SERIAL PRIMARY KEY,
    profession_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create TABLE: Profession People (Linking People with Professions)
CREATE TABLE Profession_People (
    profession_id INT NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (profession_id, nconst),
    FOREIGN KEY (profession_id) REFERENCES Profession(profession_id) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE
);

-- Create TABLE: Cast (Relationship between TV_Movie and People)
CREATE TABLE "Cast" (
    tconst VARCHAR(20) NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (tconst, nconst),
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE
);

-- Create TABLE: Famous Work (Another Relationship between TV_Movie and People)
CREATE TABLE Famous_Work (
    tconst VARCHAR(20) NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (tconst, nconst),
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE
);



