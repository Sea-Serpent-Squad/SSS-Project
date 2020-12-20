let mysql = require('mysql');
const util = require('util');

module.exports = class database {

    constructor() {

        this.config = {
            host: 'localhost',
            user: 'user',
            password: 'user',
            database: 'logistic',
            multipleStatements: true
        }
        this.connection = mysql.createConnection(this.config);
        // обертка для connection.query, чтобы можно было использовать query в async-await связках
        this.query = util.promisify(this.connection.query).bind(this.connection);
        this.setConnection();
    };

    setConnection() {
        this.connection.connect(err => {
            if (err) {
                console.error(`DB: connection error: ${err.stack}`);
            } else {
                console.log(`DB: successful connection for id ${this.connection.threadId}`);
            }
        });
    };

    // - получение списка ID заявок
    async getOrderIdList() {
        try {
            const results = await this.query(`SELECT ID_Заявка FROM заявка order by ID_Заявка`);
            let list = [];
            results.forEach(element => list.push(element['ID_Заявка']));
            return list;
        } catch (error) {
            console.error(`BD: ${error}`);
        }
    };

    async getFilledRow(id) {
        const results = await this.query(`call getFilledRow('${id}')`);
        if (!results[0][0]) throw new Error("Order not found");
        return results[0][0];
    }
    async isOrderExist(ID) {
        try {
            const results = await this.query(`SELECT COUNT(*) FROM заявка WHERE ID_Заявка = "${ID}"`);
            const value = results[0]['COUNT(*)'];
            if (value == 1) return true;
            else return false;
        } catch (error) {
            console.error(`BD: ${error}`);
            return false;
        }
    }
    // - получение списка заявок с соответстующими данными заявки
    async getOrderList() {
        let filledRowList = [];
        try {
            // получаем список ID заявок
            let idList = await this.getOrderIdList();
            filledRowList = [];
            for (const ID of idList) {
                let row = await this.getFilledRow(ID);
                filledRowList.push(row);
            };
        } catch (error) {
            console.error(`BD: ${error}`);
        }
        return filledRowList;
    };

    // - для получения данных о заявке на второй странице
    async getOrderInfo(ID) {
        try {
            const results = await this.query(`call getOrderInfo('${ID}')`);
            return results[0][0];
        } catch (error) {
            console.error(`BD: ${error}`);
        }
    }
};