https://github.com/KirillovItstep/classworks/tree/main/NorthWind
https://github.com/KirillovItstep/classworks/blob/main/NorthWind/northwind.db
https://www.google.com/search?q=northwind+database+schema&rlz=1C1GCEU_ruBY1023BY1024&source=lnms&tbm=isch&sa=X&ved=2ahUKEwj2meP7_JL9AhXqsaQKHUnxAeAQ_AUoAXoECAEQAw&biw=1920&bih=880&dpr=1&safe=active&ssui=on#imgrc=jnevTQNS8mXRDM
https://docs.yugabyte.com/preview/sample-data/northwind/

 view от temp table
 
  update categories set category_name='Bev'  where category_name='Bevetages'; для view
  
  --создание view
  create view if not exists cat_prod as
select category_name, product_name, unit_price from categories
inner join products on categories.category_id=products.category_id; 
  
  alex говорит:select category_name, count(*) from cat_prod 
group by category_name; 


select category_name, count(*) from cat_prod 
group by category_name
union all
select '-----', '-----'
union all
select 'Total', count(*) from  cat_prod; 
┌────────────────┬──────────┐
│ category_name  │ count(*) │
├────────────────┼──────────┤
│ Beverages      │ 12       │
│ Condiments     │ 12       │
│ Confections    │ 13       │
│ Dairy Products │ 10       │
│ Grains/Cereals │ 7        │
│ Meat/Poultry   │ 6        │
│ Produce        │ 5        │
│ Seafood        │ 12       │
│ -----          │ -----    │
│ Total          │ 77       │
└────────────────┴──────────┘

Создать представление для вывода регионов и территорий
create view if not exists reg_ter as
select region_description, territory_description from region
left join territories on territories.region_id=region.region_id; 

Используя представление, вывести регионы и количество территорий в них
select region_description, count(*) from reg_ter 
group by region_description
union all
select '-----', '-----'
union all -- что это???????????????
select 'Total', count(*) from  reg_ter;

--cross join  каждый с каждым 
Создать таблицу карт (от 6 до туза) и их мастей
create temporary table ranks(name varchar(2));
create temporary table suits(name varchar(10));
INSERT INTO ranks(name) VALUES('6'),('7'),('8'),('9'),('10'),('В'),('Д'),('К'),('Т');
INSERT INTO suits(name) VALUES ('пики'),('червы'),('бубны'),('трефы');
select * from ranks;
select * from suits; 
 // select *from ranks cross join suits;
 
 --union ,union all, except ,intersect
 CREATE temporary TABLE t1(v1 INT);
INSERT INTO t1(v1) VALUES(1),(2),(3);
CREATE temporary TABLE t2(v2 INT);
INSERT INTO t2(v2) VALUES(2),(3),(4);
SELECT v1 FROM t1
UNION all
SELECT v2 FROM t2;

┌────┐
│ v1 │
├────┤
│ 1  │
│ 2  │
│ 3  │
│ 2  │
│ 3  │
│ 4  │
└────┘
drop table if exists t1;
drop table if exists t2; 
 CREATE temporary TABLE t1(v1 INT);
INSERT INTO t1(v1) VALUES(1),(2),(3);
CREATE temporary TABLE t2(v2 INT);
INSERT INTO t2(v2) VALUES(2),(3),(4);
SELECT v1 FROM t1
UNION 
SELECT v2 FROM t2;
┌────┐
│ v1 │
├────┤
│ 1  │
│ 2  │
│ 3  │
│ 4  │
└────┘


drop table if exists t1;
drop table if exists t2; 
 CREATE temporary TABLE t1(v1 INT);
INSERT INTO t1(v1) VALUES(1),(2),(3);
CREATE temporary TABLE t2(v2 INT);
INSERT INTO t2(v2) VALUES(2),(3),(4);
SELECT v1 FROM t1
except 
SELECT v2 FROM t2;
┌────┐
│ v1 │
├────┤
│ 1  │
└────┘

drop table if exists t1;
drop table if exists t2; 
 CREATE temporary TABLE t1(v1 INT);
INSERT INTO t1(v1) VALUES(1),(2),(3);
CREATE temporary TABLE t2(v2 INT);
INSERT INTO t2(v2) VALUES(2),(3),(4);
SELECT v1 FROM t1
intersect
SELECT v2 FROM t2;
┌────┐
│ v1 │
├────┤
│ 2  │
│ 3  │
└────┘

--triggers -- срабатывает либо before(перед взаимодействием), либо  after(после взаимодействия) при insert update delete
Создать триггер, который добавляет в новую таблицу территории при добавлении ее в основную таблицу
create table new_territories(id INTEGER PRIMARY KEY autoincrement, name text not null);
drop trigger if exists insert_territory;
CREATE TRIGGER insert_territory after insert ON territories
  BEGIN
    insert into new_territories(name) values(new.territory_description);
  END;  
  
  insert into territories(territory_id, territory_description, region_id) values(98209, 'new territory 2',2); 
select * from new_territories; 
insert into territories(territory_id, territory_description, region_id) values(98209, 'new territory 2',2); 
select * from new_territories; 


Создать триггер, который проверяет название добавляемой территории (название не менее двух букв)
drop trigger if exists validate_territory_before_insert;
CREATE TRIGGER validate_territory_before_insert
   BEFORE INSERT ON territories
BEGIN
   SELECT
      CASE
	WHEN NEW.territory_description NOT LIKE '%__' THEN
   	  RAISE (ABORT,'Invalid name of territory')
       END;
END;
 insert into territories(territory_id, territory_description, region_id) values(98111, '1',1); 

--индексы (не пон) 
drop index ind_territory;
 CREATE INDEX ind_territory ON territories (territory_description);
 pragma index_list(territories);
.indices
.indices territories 

EXPLAIN QUERY PLAN 
SELECT territory_description FROM territories
WHERE territory_description like 's%'; 

--транзакции 
drop table if exists accounts;
drop table if exists account_changes;

CREATE TABLE accounts ( 
	account_no INTEGER NOT NULL, 
	balance DECIMAL NOT NULL DEFAULT 0,
	PRIMARY KEY(account_no),
        CHECK(balance >= 0)
);

CREATE TABLE account_changes (
	change_no integer PRIMARY KEY autoincrement,
	account_no INTEGER NOT NULL, 
	flag TEXT NOT NULL, 
	amount DECIMAL NOT NULL, 
	changed_at TEXT NOT NULL 
);

INSERT INTO accounts (account_no,balance) VALUES (100,2000);
INSERT INTO accounts (account_no,balance) VALUES (200,1000); 
┌────────────┬─────────┐
│ account_no │ balance │
├────────────┼─────────┤
│ 100        │ 2000    │
│ 200        │ 1000    │
└────────────┴─────────┘
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_no = 100;
UPDATE accounts SET balance = balance + 100 WHERE account_no = 200;
INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(100,'-',100,datetime('now'));

INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(200,'+',100,datetime('now'));

COMMIT; 

 select *from accounts;
┌────────────┬─────────┐
│ account_no │ balance │
├────────────┼─────────┤
│ 100        │ 1900    │
│ 200        │ 1100    │
└────────────┴─────────┘
 select *from account_changes;
┌───────────┬────────────┬──────┬────────┬─────────────────────┐
│ change_no │ account_no │ flag │ amount │     changed_at      │
├───────────┼────────────┼──────┼────────┼─────────────────────┤
│ 1         │ 100        │ -    │ 100    │ 2023-02-13 18:11:31 │
│ 2         │ 200        │ +    │ 100    │ 2023-02-13 18:11:31 │
└───────────┴────────────┴──────┴────────┴─────────────────────┘
 BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_no = 100;
UPDATE accounts SET balance = balance + 100 WHERE account_no = 200;
INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(100,'-',100,datetime('now'));

INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(200,'+',100,datetime('now'));
rollback; -- отмена транзакции

снять сумму привышаюшую текущую 
BEGIN TRANSACTION;
UPDATE accounts
   SET balance = balance - 20000
 WHERE account_no = 100;
INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(100,'-',20000,datetime('now'));

SELECT * FROM account_changes; 
rollback;

