TDD - tema
https://www.w3resource.com/java-exercises/basic/index.php



fishing_id v table busket foreiang key 



nosql mongo.db
bin\mongod --dbpath data\db  сервер соединение

--Найти служащего с заданным id
db.employer.find({id:68319})
db.employer.find({name:"KAYLING"})
db.employer.countDocuments()
Отобразить id и имена менеджеров.
db.employer.find({job: 'MANAGER'},{id:1, name:1}) 
Отобразить id и имена менеджеров всех сотрудников.
db.employer.aggregate([{
$lookup: {
from: "employer",
localField: "manager_id",
foreignField: "id",
as: "manager",
"pipeline": [{
$project : { name:1, manager:{id:1, name:1}}}
]
}
}]); 


