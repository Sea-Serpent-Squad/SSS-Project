// подключаем нужные модули (библиотеки)
const express = require('express');
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const path = require('path');
const port = 80;



let baseHandler = require('./database.js')

let baseUsing = new baseHandler()

baseUsing.getStartEndPoint(1);

// открываем доступ к статике, т.е к папке public (css, js, картинки)
app.use(express.static("../frontend/public/"));
// главная страница
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../frontend/pages', 'main_page.html'));
});
// временно так, а вообще будет для каждой заявки /order/@ID, где вместо @ID - номер заявки
app.get('/order/20-10-4', (req, res) => {
    // baseUsing.testQuery();
    res.sendFile(path.join(__dirname, '../frontend/pages', 'second_page.html'));
});


// сокеты
io.on('connection', (socket) => {
    console.log(socket.id + 'user connected');
    socket.on('disconnect', () => {
        console.log(socket.id + ' user disconnected');
      });
});

http.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});

// для ввода в консоль сервера
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.on('line', (input_str) => {
    let i = input_str.search(":");
    let command = input_str.substr(0, i);
    let arg = input_str.substr(i+2);
    if (command == "newRow")
    {
        let s = arg.split(',');
        io.emit(command, {orderID: s[0], orderName: s[1]});
    }
    else {
        console.log("Wrong input");
    }
});

rl.on('SIGINT', () => { process.exit(); });

