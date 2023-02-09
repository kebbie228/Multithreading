insert into character(name) values('CarterWard');
insert into character(race) values('Dwarves');

insert into race(name) values('Dwarves');
   insert into race(name) values('Elves');

   insert into race(name) values('Humans');

   insert into race(name) values('Goblins');

   insert into race(name) values('Orcs');

   UPDATE  character  SET  race_id=1 where id>=2 and id<10;
   UPDATE  character  SET  race_id=1 where id%5=4;
   UPDATE  character  SET  race_id=2 where id%5=3;
   UPDATE  character  SET  race_id=3 where id%5=2;
   UPDATE  character  SET  race_id=4 where id%5=1;
   UPDATE  character  SET  race_id=5 where id%5=0;
      UPDATE  character  SET  race_id=1 where id>=2 and id<10;
   UPDATE  character  SET  race_id=1 where id%5=4;
   UPDATE  character  SET  race_id=2 where id%5=3;
   UPDATE  character  SET  race_id=3 where id%5=2;
   UPDATE  character  SET  race_id=4 where id%5=1;
   UPDATE  character  SET  race_id=5 where id%5=0;

      insert into class(name) values('Warrior');
        insert into class(name) values('Gunslinger');
           insert into class(name) values('Archer');
           insert into class(name) values('Assassin');
           insert into class(name) values('Tank');


UPDATE character SET item = 1 WHERE id%5=0;
UPDATE character SET item = 2 WHERE id%5=1;
UPDATE character SET item = 3 WHERE id%5=2;
UPDATE character SET item = 4 WHERE id%5=3;
UPDATE character SET item = 5 WHERE id%5=4;
ALTER TABLE character add COLUMN class_id integer;
//цена вес уникальность макс в инвентаре
create table item (id integer not null primary key autoincrement, name text not null unique,
price integer  default 0,  weight real, rarity integer check(rarity between  1 and 5) default 1, maximum integer default 1);
    insert into item(name) values('Tank');


nsert into item(name) values('Adobe');
insert into item(name) values('Aluminum Ingot');
insert into item(name) values('Animal Bone');
insert into item(name) values('Animal Fat');
insert into item(name) values('Animal Hide');
insert into item(name) values('Bamboo Stick');
insert into item(name) values('Beeswax');
insert into item(name) values('Black Dye');
insert into item(name) values('Blue Alloy');
insert into item(name) values('Blue Coral Powder');
insert into item(name) values('Blue Dye');
insert into item(name) values('Blue Metal');
insert into item(name) values('Bolts');
insert into item(name) values('Brick');
insert into item(name) values('Bronze Ingot');
insert into item(name) values('Carved Wood');
insert into item(name) values('Cattail');
insert into item(name) values('Cement');
insert into item(name) values('Charcoal');
insert into item(name) values('Clay');
insert into item(name) values('Cloth');
insert into item(name) values('Coal');
insert into item(name) values('Copper Ingot');
insert into item(name) values('Copper Ore');
insert into item(name) values('Crafted Leather');
insert into item(name) values('Cursed Wood');
insert into item(name) values('Duct Tape');
insert into item(name) values('Electronic Components');
insert into item(name) values('Empty Can');
insert into item(name) values('Feather');
insert into item(name) values('Fertile Soil');
insert into item(name) values('Firewood');
insert into item(name) values('Flint');
insert into item(name) values('Gas');
insert into item(name) values('Glass');
insert into item(name) values('Glue');
insert into item(name) values('Gold Ingot');
insert into item(name) values('Gold Nugget');
insert into item(name) values('Gravel');
insert into item(name) values('Green Dye');
insert into item(name) values('Hard Skin');
insert into item(name) values('Hardwood');
insert into item(name) values('Iron Ingot');
insert into item(name) values('Iron Ore');
insert into item(name) values('Jade');
insert into item(name) values('Large Stone');
insert into item(name) values('Leather');
insert into item(name) values('Leather Straps');
insert into item(name) values('Marble');
insert into item(name) values('Metal Scraps');
insert into item(name) values('Metal Shard');
insert into item(name) values('Metal Wire');
insert into item(name) values('Monster Scales');
insert into item(name) values('Nails');
insert into item(name) values('Orange Dye');
insert into item(name) values('Paper');
insert into item(name) values('Plant Fiber');
insert into item(name) values('Plastic');
insert into item(name) values('Purple Coral Powder');
insert into item(name) values('Purple Dye');
insert into item(name) values('Quartz');
insert into item(name) values('Red Coral Powder');
insert into item(name) values('Red Dye');
insert into item(name) values('Rooftiles');
insert into item(name) values('Rope');
insert into item(name) values('Rubber');
insert into item(name) values('Sand');
insert into item(name) values('Sharp Stone');
insert into item(name) values('Silicon');
insert into item(name) values('Silver Ingot');
insert into item(name) values('Silver Ore');
insert into item(name) values('Slate');
insert into item(name) values('Small Stone');
insert into item(name) values('Steel Ingot');
insert into item(name) values('Steel Plates');
insert into item(name) values('Stick');
insert into item(name) values('Straws');
insert into item(name) values('Thread');
insert into item(name) values('Timber');
insert into item(name) values('Tin');
insert into item(name) values('Titanium Dust');
insert into item(name) values('Titanium Ingot');
insert into item(name) values('Turquoise');
insert into item(name) values('Varnish');
insert into item(name) values('Whetstone');
insert into item(name) values('White Coral Powder');
insert into item(name) values('White Dye');
insert into item(name) values('Wood Log');
insert into item(name) values('Wood Planks');
insert into item(name) values('Wool');
insert into item(name) values('Yellow Coral Powder');
insert into item(name) values('Yellow Dye');
UPDATE item SET price = random()%1000+1000;
UPDATE item SET weight = (random()%100+100)/10;
UPDATE item SET maximum = abs(random()%25)+1;

create table inventory (id integer not null primary key autoincrement, character_id integer ,item_id integer);


//Вывести имена персонажей и список предметов
select  c.id,c.name, i.name
from  character as c,item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id)and (c.id=2);


select inv.item_id, c.name, i.name

from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and (c.id=2)
order by inv.item_id;

select count(*)
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and (c.id=2);

select count(*) from inventory where character_id=2;
DELETE FROM item WHERE id=50;

// Вывести всех персонажей, у которых в инвентаре содержатся предметы с редкостью 5
select c.name, i.name, i.rarity
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and (i.rarity=5);

//вывести перс у которых есть glass
select c.name, i.name
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and (i.name='Glass')
GROUP BY c.name
order by c.name; //sort

// вывести вес инвентаря у персонажа с id=2
select c.name, sum(i.weight)
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and (c.id=2)
GROUP BY c.name
order by c.name; //sort

//общий вес всех инвентарей
select  sum(i.weight)
from item as i, inventory as inv
where  (i.id=inv.item_id);

--У каких персонажей количество вещей = 20...25 ???????
select  c.name, count(i.id) as cc
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and( cc=25)
group by c.id;


--Количество вещей у каждого персонажа
select  c.name, count(i.id)
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id)
group by c.id;
-- сколько вещей у второго перс
select  c.name, count(i.id)
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and(c.id=2)
group by c.id;

--Предмет, который реже всего встречается в инвентаре
select  i.name, count(inv.item_id) as cc
from item as i, inventory as inv
where (i.id=inv.item_id)
group by inv.item_id
order by cc
limit 1;
--Предмет, который чаще всего встречается в инвентаре
selecti.name, count(inv.item_id) as cc
from item as i, inventory as inv
where (i.id=inv.item_id)
group by inv.item_id
order by cc desc
limit 1;

--ввывести прс и их расы
select c.name, r.name
from character as c
inner join  race as r
on(c.race_id=r.id)
where(r.name='Orcs');

// сколько прс разных рас
select c.name, count(c.id)
from character as c
inner join  race as r
on(c.race_id=r.id)

group by r.name;


https://github.com/KirillovItstep/classworks/tree/main/characters
https://github.com/KirillovItstep/classworks/tree/main/characters
https://github.com/KirillovItstep/classworks/tree/main/characters
--Вывести персонажей, их расы и классы
select count(*) from(select c.name, r.name, l.name

from character as c, race as r, class as l
where (c.race_id=r.id)and(c.class_id=l.id)
);

select count(*) from(select c.name, r.name, l.name

from character as c
inner join race as r
on(c.race_id=r.id)
inner join class as l
on(c.class_id=l.id));

--Сколько у каждого персонажа вещей в инвентаре?
select c.name, count(i.id)
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id)
group by
c.id;

--У кого из эльфов имя начинается на "T"?
select name from character where name Like'T%'and race_id=2 ;

--У кого из воинов самое короткое имя?
select c.name
from character as c
inner join class as l
on (c.class_id=l.id)
where l.name='Warrior'
order  by length (c.name)
limit 1;
--Вывести список всех людей-лучников

--Какой класс воинов самый распространенный у гномов?
select c.name, r.name, l.name, count(l.id) as count
from character as c
inner join race as r
on(c.race_id=r.id)
inner join class as l
on(c.class_id=l.id)
where r.name='Dwarves'
group by l.name
order by count desc
limit 1;

--Вывести количество персонажей в каждой расе
select r.name, count(c.id) as count
from character as c
inner join race as r
on(c.race_id=r.id)
group  by r.id;

--Сколько персонажей не принадлежат к известной расе?
select t.count from
(select r.name, count(c.id) as count
from character as c
left join race as r
on(c.race_id=r.id)
group  by r.id) as t
where t.name is null;

select r.name, count(c.id) as count
from character as c
left join race as r
on(c.race_id=r.id)
group  by r.id
having r.name is null;

--У кого из гномов есть серебро?
select c.name, r.name, i.name
from character as c, item as i, race as r, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id) and (i.name like '%Silver%') and (r.name = 'Dwarves');
--Каждому гному раздать по серебряной руде (Silver ore)
drop table if exists dwarves;
create  temp table  dwarves as
select c.id, (select id from item
where name='Silver Ore')
from character as c
inner join race as r
on(c.race_id=r.id)
where r.name='Dwarves';
insert into inventory(character_id,item_id)
select  * from  dwarves;
--Вывести по 3 самых тяжелых вещи в инвентаре для каждого персонажа
drop table if exists weights;
create temp table weights as
select c.id,c.name,i.name, i.weight
from character as c, item as i, inventory as inv
where (c.id=inv.character_id) and (i.id=inv.item_id)
order by c.name, i.weight desc;

select * from weights as w
where (select count(*) from weights where w.id=id and weight>=w.weight)<=3;
--Удалить из инвентаря вещи, если их количество превышает 30 для одного персонажа

drop table if exists chars;
create temp table chars as
select
c.id
,
c.name
, count(
i.id
)-30 as extra
from character as c, inventory as inv, item as i
where (c.id=inv.character_id)and(i.id=inv.item_id)
group by
c.name

having extra>0;

select
inv.id
,
c.id
 as character_id, ch.extra
from character as c, inventory as inv, item as i, chars as ch
where (c.id=inv.character_id) and (i.id=inv.item_id)and(
ch.id=c.id
)
order by
c.id
;

/*
Установка mysql
Скачать архив .zip нужной версии
https://downloads.mysql.com/archives/community/

Extract the downloaded MySQL Server Archive to the desired location
Create a directory for MySQL's database's data files (example : D:\mysql\mydb)
Create a directory for MySQL's database logging (example D:\mysql\logs)
Create MySQL options file (example location : D:\mysql\config.ini)
config.ini:
[mysqld]
sql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
# set basedir to your installation path
basedir = "D:\\Program Files\\MySQL\\mysql"
# set datadir to the location of your data directory
datadir = "D:\\Program Files\\MySQL\\mysql\\data"
# The port number to use when listening for TCP/IP connections. On Unix and Unix-like systems, the port number must be
# 1024 or higher unless the server is started by the root system user.
port = "3306"
# Log errors and startup messages to this file.
log-error = "D:\\Program Files\\MySQL\\mysql\\logs\\error_log.err"

[mysqladmin]
user = "root"
port = "3306"
 */

 https://github.com/KirillovItstep/classworks/tree/main/students
 https://github.com/KirillovItstep/classworks/tree/main/students
 https://github.com/KirillovItstep/classworks/tree/main/students