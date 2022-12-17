create table if not exists Genre(
id serial primary key,
name varchar(50) not null); 

create table if not exists Executor(
id serial primary key,
name_executor varchar(100) not null);

create table if not exists GenreExecutor(
Genre_id integer references Genre(id),
Executor_id integer references Executor(id),
constraint pk_GenreExecutor primary key (Genre_id,Executor_id));

create table if not exists Album(
id serial primary key,
name_album varchar(50) not null,
year_of_release date);

create table if not exists ExecutorAlbum(
Executor_id integer references Executor(id),
Album_id integer references Album(id),
constraint pk_ExecutorAlbum primary key (Executor_id,Album_id));

create table if not exists track(
id serial primary key,
track_name varchar (50) not null,
track_length time,
album_id integer references album(id));

create table if not exists Сollection(
id serial primary key,
collection_name varchar(50) not null,
year_of_release date); 

create table if not exists TrackСollection(
Track_id integer references Track(id),
Сollection_id integer references Сollection(id),
constraint pk_TrackСollection primary key (Track_id,Сollection_id));

















