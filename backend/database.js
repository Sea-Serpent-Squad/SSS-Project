let mysql = require('mysql');

module.exports = class database {

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

    constructor() {

        this.config = {
            host: 'localhost',
            user: 'user',
            password: 'user',
            database: 'logistic',
            multipleStatements: true
        }
        this.connection = mysql.createConnection(this.config)

        this.setConnection()
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
        return new Promise((resolve) =>
        {
            this.connection.query(`CALL getStartEndPointsOfApp('${id}', @output1, @output2); SELECT @output1, @output2`, [point1, point2], (error, results) => {
                if (error) {
                    return console.error(error.message);
                }
                try {
                    point1 = JSON.stringify(results[1][0]["@output1"]).replaceAll('\"', '')
                    point2 = JSON.stringify(results[1][0]["@output2"]).replaceAll('\"', '');
                    resolve(point1 == point2 ? point1 : `${point1} - ${point2}`);
                } catch (e) {
                    console.log(e)
                }
            })
        })
    }

    // - получение списка заявок, для формирования списка заявок на главной странице
    getAppIds()
    {
        return new Promise((resolve) =>
        {
            this.connection.query(`SELECT ID_Заявка FROM заявка order by ID_Заявка`, (error, results) => {
                if (error) {
                    return console.error(error.message);
                }
                try {
                    let list = []
                    results.forEach(element => list.push(element['ID_Заявка']))
                    resolve(list);
                } catch (e) {
                    console.log(e)
                }
            })
        })
    }

    async getFilledRow(id)
    {
        return new Promise((resolve)=>
        {
            this.connection.query(`call getFilledRow('${id}')`, (error, results)=>
            {
                 this.getStartEndPoint(id).then(val => results[0][0]['Место работы'] = val).then(() => resolve(results[0][0]))
            })
        })
    }

    // - получение списка заявок, с определениями
    async getAppsList() {
        let idList = await this.getAppIds()
        let values = []
            idList.forEach(element => {
                values.push(new Promise( (resolve) => {
                resolve(this.getFilledRow(element))
                }
            ))
            })
        return await Promise.allSettled(values)
    }
}

