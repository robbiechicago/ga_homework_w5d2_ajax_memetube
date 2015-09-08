drop database sinatra_memetube;
create database sinatra_memetube;

\connect sinatra_memetube
drop table videos;

create table videos (
  id serial8 primary key,
  title varchar(100),
  url varchar(200),
  dscr varchar(400),
  rating smallint check (rating > 0 and rating <6)
);

insert into videos (title, url, dscr) values ('Charlie Austin scores a cracking goal as Swindon beat Southampton 1-0 at St.Marys', 'OqE2vkYYNB8', 'Glad we moved seats as we were near the back in the first half ! Charlie takes his goal brilliantly to give Swindon a 1-0 win at Southampton. Also brought me 36 pounds from a 1 pound stake as I''d bet on Austin to score first and 1-0 Town. What a memorable night out in Southampton !');

insert into videos (title, url, dscr) values ('Swindon Town score in the last minute to equalise against Brentford 3-3 in 2013 play-off','_SMIHbMLZ6A','Swindon come from 3-1 down and score the equaliser with virtually the last kick of normal time. One of the most euphoric celebrations I have EVER been lucky enough to be a part of!');

insert into videos (title, url, dscr) values ('DANNY WARD','aMsARnMuHwk','Danny ward vs Charlton');

insert into videos (title, url, dscr) values ('Swindon Town 1-0 Bristol City Michael Smith Goal','pL2TcjAe05U','Swindon Town 1-0 Bristol City. Smith winning goal!');

insert into videos (title, url, dscr) values ('Nathan Byrne 90"+4 injury time winner - Sheffield Utd v Swindon Town, 1st Leg Play-Off Semi Finals','VXQlNMTBGVk','Nathan Byrne nets Swindon Town''s last gasp winner away at Sheffield Utd to take a slender 2-1 advantage to the County Ground for the 2nd leg in the League One Play-Off Semi Finals with a place at Wembley at stake.');
