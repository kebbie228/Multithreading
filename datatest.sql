//Вывести имена персонажей и список предметов
SELECT c.id, c.name, i.name
from CHARACTER as c, inventory as inv, item as i
where(c.id=inv.character_id) and(inv.item_id=i.id)
GROUP by c.id;
SELECT c.id,c.name,i.name
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id)
GROUP by c.id;

// Вывести всех персонажей, у которых в инвентаре содержатся предметы с редкостью 5
SELECT c.id,c.name,i.name, i.rarity
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id) and(i.rarity=5)
GROUP by c.id;

//вывести айди предмета -название - и его редкость 
select i.id,i.name, i.rarity
FROM item as i,inventory as inv
where(inv.item_id=i.id)
GROUP by i.name;

//вывести перс у которых есть glass
SELECT c.id,c.name, i.name
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id) and(i.name='Glass')
GROUP by c.name;

// вывести вес инвентаря у персонажа с id=2

SELECT c.id,c.name, sum(i.weight)
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and (c.id=2) and(i.id=inv.item_id);

//общий вес всех инвентарей
SELECT sum(i.weight)
from  item as i,inventory as inv
where (i.id=inv.item_id);

//У каких персонажей количество вещей = 20...25 ??????
//SELECT c.id, c.name, count(i.id) as cc
//from CHARACTER as c, item as i,inventory as inv
//where(c.id=inv.character_id) and(i.id=inv.item_id) and( cc=25);

//Количество вещей у каждого персонажа
SELECT c.id, c.name, count(i.id)
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id)
GROUP by c.id;

// сколько вещей у второго перс
SELECT c.id, c.name, count(i.id)
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id) and (c.id=2)
GROUP by c.id;

//Предмет, который реже всего встречается в инвентаре
SELECT c.id, c.name, count(i.id) as cc
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id)
GROUP by c.id
ORDER by cc
limit 1;
//Предмет, который чаще всего встречается в инвентаре
SELECT c.id, c.name, count(i.id) as cc
from CHARACTER as c, item as i,inventory as inv
where(c.id=inv.character_id) and(i.id=inv.item_id)
GROUP by c.id
ORDER by cc DESC --по убыванию
limit 1;
------------------------------------------------------
SELECT c.id, c.name, count(i.id) as cc
FROM character as c
inner join inventory as inv
on(c.id=inv.CHARACTER_id)
inner join item as i
on(i.id=inv.item_id)
GROUP by c.id
ORDER by cc DESC --по убыванию
limit 1;
//ввывести прс и их расы
???
//Вывести персонажей, их расы и классы
SELECT c.id, c.name, r.name,cl.name
FROM CHARACTER as c, race as r, class as cl 
where(c.race_id=r.id) and (c.class_id=cl.id) 
GROUP by c.id;

//Сколько у каждого персонажа вещей в инвентаре?

SELECT c.id, c.name, count(i.id)as cc
FROM character as c
inner join inventory as inv
on(c.id=inv.character_id)
inner join item as i
on(i.id=inv.item_id)
GROUP by c.id
ORDER by cc;

--У кого из эльфов имя начинается на "T"?
SELECT c.id, c.name, cl.name
FROM character as c
inner join race as r
on(c.id=c.race_id)
on(r.name='Elf')
and
on(c.name='T%');
-- правильный вариант select name from character where name Like'T%'and race_id=2 ;

--У кого из воинов самое короткое имя?
select c.name,cl.name
FROM character as c, class as cl 
WHERE(c.class_id=cl.id) and (cl.name='Warrior')

order by LENGTH(c.name) 
limit 1;
--Вывести список всех людей-лучников
select c.id, c.name, cl.name, r.name
from character as c, class as cl, race as r
where(c.class_id=cl.id) and (cl.name='Archer') and ( c.race_id=r.id) and (r.name='Humans')
GROUP by c.id;

select c.id, c.name, cl.name, r.name
FROM character as c
inner join class as cl 
on(c.class_id=cl.id)
inner join class as cl 
on(cl.id=cl.name='Archer');
