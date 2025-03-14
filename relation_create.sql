-- Create Table: TV_Movie
CREATE table TV_Movie(
	tconst varchar(20) PRIMARY KEY not null,
	titleType VARCHAR(50) CHECK (titleType IN ('movie', 'short', 'tvMovie', 'tvSeries', 'tvMiniSeries', 'tvSpecial', 'video', 'videoGame','tvPilot','tvShort')), 
	primaryTitle varchar(200) not null,
	originalTitle varchar(200),
	isAdult boolean default false,
	startYear int,
	endYear int,
	runtimeMinutes int,
	
)

-- Create Table: Title Aliases
create table Title_Aliases(
	titleId varchar(20) not null,
	"ordering" serial not null,
	title varchar(200) not null,
	region varchar(20),
	"language" varchar(20),
	isOriinalTitle boolean not null,
	PRIMARY KEY(titleId,"ordering")
)

-- Create Table: Genres
CREATE TABLE Genres (
    genreID SERIAL PRIMARY KEY,
    genre VARCHAR(20) NOT NULL UNIQUE
);

-- Create Table: genres_movie (Join Table for TV_Movie and Genres)
CREATE TABLE genres_movie (
    genreID INT NOT NULL,
    tconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (genreID, tconst),
    FOREIGN KEY (genreID) REFERENCES Genres(genreID) ON DELETE CASCADE,
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create Table: Episode
CREATE TABLE Episode (
    tconst INT PRIMARY KEY NOT NULL,
    parentTconst VARCHAR(20) NOT NULL,
    seasonNumber INT,
    episodeNumber INT,
    FOREIGN KEY (parentTconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create Table: Episode Details
CREATE TABLE Episode_Details (
    tconst INT PRIMARY KEY,
    primaryTitle VARCHAR(200) NOT NULL,
    originalTitle VARCHAR(200),
    startYear INT,
    runtimeMinutes INT,
    FOREIGN KEY (tconst) REFERENCES Episode(tconst) ON DELETE CASCADE
);

-- Create Table: Ratings
CREATE TABLE Ratings (
    tconst VARCHAR(20) PRIMARY KEY,
    averageRating FLOAT,
    numVotes INT NOT NULL,
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE
);

-- Create Table: People
CREATE TABLE People (
    nconst VARCHAR(20) PRIMARY KEY,
    primaryName VARCHAR(200) NOT NULL,
    birthYear INT,
    deathYear INT
);

-- Create Table: Job Category
CREATE TABLE Job_Category (
    category VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL PRIMARY KEY
);

-- Create Table: Job People (Relationship between TV_Movie and People via Jobs)
CREATE TABLE Job_People (
    tconst VARCHAR(20) NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    job VARCHAR(50) NOT NULL,
    PRIMARY KEY (tconst, nconst,job),
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE,
    FOREIGN KEY (job) REFERENCES Job_Category(job) ON DELETE CASCADE
);

-- Create Table: Profession
CREATE TABLE Profession (
    profession_id SERIAL PRIMARY KEY,
    profession_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create Table: Profession People (Linking People with Professions)
CREATE TABLE Profession_People (
    profession_id INT NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (profession_id, nconst),
    FOREIGN KEY (profession_id) REFERENCES Profession(profession_id) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE
);

-- Create Table: Cast (Relationship between TV_Movie and People)
CREATE TABLE Cast (
    tconst VARCHAR(20) NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (tconst, nconst),
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE
);

-- Create Table: Famous Work (Another Relationship between TV_Movie and People)
CREATE TABLE Famous_Work (
    tconst VARCHAR(20) NOT NULL,
    nconst VARCHAR(20) NOT NULL,
    PRIMARY KEY (tconst, nconst),
    FOREIGN KEY (tconst) REFERENCES TV_Movie(tconst) ON DELETE CASCADE,
    FOREIGN KEY (nconst) REFERENCES People(nconst) ON DELETE CASCADE
);



