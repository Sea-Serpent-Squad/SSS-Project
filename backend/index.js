// подключаем нужные модули (библиотеки)
const express = require('express');
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const path = require('path');
const port = 80;

let baseHandler = require('./database.js')

let baseUsing = new baseHandler()

// сокеты
io.on('connection', (socket) => {
    console.log(socket.id + ' user connected');
    socket.on('disconnect', () => {
        console.log(socket.id + ' user disconnected');
    });

    socket.on('getStartRows', ()=>
    {
        baseUsing.getAppsList().then(values =>
        {
            values.forEach(element => io.emit('setStartRows',
                {
                    Статус : element.value['Статус'],
                    ID: element.value['№ заявки'],
                    Места: element.value['Место работы'],
                    Описание: element.value['Описание работ'],
                    Время: element.value['Время подачи'],
                    Приоритет: element.value['Приоритет'],
                    Цех: element.value['Цех']
                }))})}
    )

    socket.on('getAppInfo', (id)=>
    {
        baseUsing.getAppInfo(id).then(values =>
        {
            io.emit('setAppData',
        {
            ID: values[0]['ID'],
            Места: values[0]['Место работы'],
            Цех: values[0]['Цех'],
            ВремяДата: values[0]['Время и дата выполнения'],
            Ответственный: values[0]['Ответственный'],
            Описание: values[0]['Описание работы']
        })  })
    })
});

/*
// let res = baseUsing.getStartEndPoint('20-10-1').then(results=>console.log(results))
// - получение данных из базы
let res = baseUsing.getAppsList().then(values =>
    {
        values.forEach(element => io.emit('setStartRows',
            {
                Статус : element.value['Статус'],
                ID: element.value['№ заявки'],
                Места: element.value['Место работы'],
                Описание: element.value['Описание работ'],
                Время: element.value['Время подачи'],
                Приоритет: element.value['Приоритет'],
                Цех: element.value['Цех']
            } ))
    }
    //console.log(values[1].value['Статус'])
)*/
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

