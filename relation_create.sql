create table TV_Movie(
	tconst varchar(20) not null,
	titleType VARCHAR(50) CHECK (titleType IN ('movie', 'short', 'tvMovie', 'tvSeries', 'tvMiniSeries', 'tvSpecial', 'video', 'videoGame','tvPilot','tvShort')), 
	primaryTitle varchar(200) not null,
	originalTitle varchar(200),
	isAdult boolean default false,
	startYear int,
	endYear int,
	runtimeMinutes int,
	primary key (tconst)
)

create table Title_Aliases(
	titleId varchar(20) not null,
	"ordering" int not null,
	title varchar(200) not null,
	region varchar(20),
	"language" varchar(20),
	isOriinalTitle boolean not null,
	primary key(titleId,"ordering")
)



