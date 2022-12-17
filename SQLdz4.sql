
1.количество исполнителей в каждом жанре

select "name"  , count(executor_id) from genreexecutor ge
join genre g on g.id = ge.genre_id
group by g."name" ;

2.количество треков, вошедших в альбомы 2019-2020 годов

select count(*) from album a
join track t on a.id  = t.album_id 
where DATE_PART('year', a.year_of_release::date) between  2020 and 2019

3.средняя продолжительность треков по каждому альбому

select a.name_album , avg(t.track_length) from track t
join album a on t.album_id  = a.id
group by name_album;

4.все исполнители, которые не выпустили альбомы в 2020 году

select name_executor from executor ex 
join executoralbum ea on ea.album_id = ex.id
join album a on a.id = ea.album_id 
where not DATE_PART('year', a.year_of_release::date) = 2020
group by name_executor;

5.названия сборников, в которых присутствует конкретный исполнитель (выберите сами)

select distinct collection_name  from  Сollection c
join trackСollection tc on tc.Сollection_id = c.id
join track t  on tc.track_id = t.id  
join album a on t.album_id  = a.id 
join executoralbum e on a.id = e.executor_id 
join executor e2 on e.executor_id = e2.id 
where e2.name_executor like  'Drake';

6. название альбомов, в которых присутствуют исполнители более 1 жанра

select a.name_album  from album a
join executoralbum e  on e.album_id = a.id 
join executor e2  on e2.id  = e.executor_id 
join genreexecutor g  on g.executor_id  = e2.id  
join genre g2  on g2.id  = g.executor_id 
group by a.name_album 
having count(distinct g2.name) = 1;

7. наименование треков, которые не входят в сборники

select name_album, count(track_name)  from track t  
join album a  on t.id  = a.id 
group by name_album; 

8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)

select e2.name_executor, t.track_length from track t
join album a on t.album_id = a.id 
join executoralbum e on e.album_id = a.id 
join executor e2 on e.executor_id = e2.id 
where t.track_length = (select min(track_length) from track);

9. название альбомов, содержащих наименьшее количество треков.

select a.name_album, count(*)  from album a
join track t on t.id =a.id 
group by name_album  
having count(*) = (select count(*) from album a
join track t on t.id = a.id 
group by a.name_album 
order by count(*)
limit 1)







