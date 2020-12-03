let mysql = require('mysql');
let mySQLEvents = require('mysql-events');

module.exports = class database {
    constructor() {

        this.config = {
            host: 'localhost',
            user: 'user',
            password: 'user',
            database: 'logistic',
            multipleStatements: true
        }
        this.connection = mysql.createConnection(this.config)
        this.events = mySQLEvents(this.config)

         this.eventAdding = this.events.add('dbName.tableName.fieldName.value',
             function (oldRow, newRow, event) {
            //row inserted
            console.log(oldRow);
            if (oldRow === null) {

            }})

        this.setConnection()
        //this.testQuery()
    }

    setConnection() {
        this.connection.connect(err => {
            if (err) {
                console.error('connection error : ' + err.stack);
                return false;
            }

            console.log('successful connection for id' + this.connection.threadId);
            return true;
        });
    }

    testQuery() {
        this.connection.query("INSERT INTO `logistic`.`заявка` (`ID_Заявка`, `ID_Статус`, `ID_Приоритет`, `ID_Сотрудник`, `Дата-время начало`, `Дата-время конец`) VALUES ('55', '1', '2', '3', '2024-05-18 10:00:00', '2024-05-18 11:00:00');", (err, results, fields) => {
            if (err) console.log(err)
            else results.forEach(element => {
                console.log(element['Название'])
            })
        })
    }

    // - Получение название начальной и конечной точки у заявки с id
    getStartEndPoint(id) {
        let point1 = '', point2 = '';
        this.connection.query(`CALL getStartEndPointsOfApp(${id}, @output1, @output2); SELECT @output1, @output2`, [point1, point2], (error, results) => {
            if (error) {
                return console.error(error.message);
            }

            point1 = JSON.stringify(results[1][0]["@output1"]).replaceAll('\"','')
            point2 = JSON.stringify(results[1][0]["@output2"]).replaceAll('\"','');

            return point1 == point2 ? point1 : `${point1} - ${point2}`;
        })
    }

    // - Формирование списка заявок на главной странице

}

