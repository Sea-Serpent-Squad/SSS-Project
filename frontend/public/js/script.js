// пройдемся во всей виртуальной технике и привяжем реакцию на событие, т.е сделаем, чтобы при нажатии на вирт. технику она выделялась кружком (selected vehicle)
// и соответственно выделение снималось, когда нажали на другую вирт. технику (или на ту же самую еще один раз)

const socket = io.connect('', {
    'forceNew': true,
    'reconnection': false
});

let i = 0,
    idCntr = 0;

const orderID = window.location.href.split('/')[4];

socket.on('setOrderData', (data) => {
    setData(data);
});

socket.on('setTimelineInfo', (data) => {
    setNewTimeline(data);
});

socket.emit('takeOrderMutex', orderID);

socket.on('disconnect', () => {
    setTimeout(() => {
        alert("Потеряно соединение с сервером. Несохраненные данные были потеряны.");
        document.location.reload();
    }, 2000);
});

let timeline = [];

function prepareCollapse() {
    document.querySelectorAll(".virt-vehicle").forEach((elem) => {
        // при клике скрываем текущий открытый блок div collapse
        $(elem).on('click', () => {
            $('.collapse.show').collapse('hide');
        });
        // выделяем кружком и блокируем нажатия на ссылки пока не раскроется блок с настоящ. техникой
        $(elem.getAttribute("href")).on('show.bs.collapse', () => {
            elem.children[0].classList.add("selected");
            document.querySelectorAll(".virt-vehicle").forEach((elem) => {
                elem.classList.add("no-link")
            });
        });
        // как только раскрылся, включаем ссылки обратно
        $(elem.getAttribute("href")).on('shown.bs.collapse', () => {
            document.querySelectorAll(".virt-vehicle").forEach((elem) => {
                elem.classList.remove("no-link")
            });
        });
        // убираем кружок при закрытии блока с техникой
        $(elem.getAttribute("href")).on('hide.bs.collapse', () => {
            elem.children[0].classList.remove("selected");
        });
    });
}

function vehicleChoice() {
    let arr = Array.from(document.querySelector("#list-of-free-vehicles-1").children);
    arr.forEach((elem) => {
        elem.children[0].addEventListener('click', () => {
            let veh = document.querySelector('a[href="#vehicle1"]');
            veh.children[1].innerText = elem.children[0].innerText;
            veh.classList.add("text-primary");
            let driver_row = veh.parentElement.nextElementSibling;
            driver_row.classList.remove("disabled");
            /* Вставка таймлайна с дорогой*/
            timeline.addItem('2020-10-31', {
                id: 5,
                group: 0,
                className: 'drive',
                start: '2020-10-31T10:00',
                end: '2020-10-31T10:59'
            }, 'Дорога')
            veh.click();
        });
    });
}

function getParsedValues(value) {
    let collection = [];
    for (let i = 0; i < value.length; i++) {
        collection.push({
            id: idCntr,
            group: idCntr++,
            className: 'bold rounded',
            start: value[i]['Начало'].replace(' ', 'T'),
            end: value[i]['Конец'].replace(' ', 'T')
        })
    }
    idCntr = 0;
    return collection;
}

async function setNewTimeline(value) {

    let parent = document.querySelector('#virt-list-of-vehicles')
    let data = document.createElement('dl')
    data.className = 'row mt-5'
    let autoLink = document.createElement('a');
    autoLink.className = 'virt-vehicle col-3 m-auto';
    autoLink.setAttribute("data-toggle", 'collapse')
    autoLink.setAttribute("role", 'button')
    autoLink.role = 'button';
    autoLink.href = `#vehicle${i}`;
    autoLink.innerHTML = `<span></span><span>${value['Техника']}</span>`;
    let location = document.createElement('dd');
    location.className = 'col-2 m-auto';
    location.innerHTML = `${value['Локация']}`;
    let timeline = document.createElement('dd');

    timeline.className = 'col-7 m-auto';
    timeline.id = `timeline${i}`;
    data.append(autoLink);
    data.append(location);
    data.append(timeline);
    parent.append(data);

    let groups = []
    value['Таймлайн'].forEach(element => {
        groups.push(element['Работа']);
    })
    timelines.push(new Timeline(`timeline${i}`, value['Таймлайн'][0]['Начало'].split(' ')[0],
        getParsedValues(value['Таймлайн']), groupNames = groups));



    let collapseList = document.getElementById("collapse-list-of-vehicles");
    let newCollapse = document.createElement("div");
    newCollapse.className = "collapse";
    newCollapse.setAttribute("id", "vehicle" + i);
    newCollapse.innerHTML = collapseList.children[0].innerHTML;
    newCollapse.children[0].innerText = "Невиртуальная сгенерированная техника №" + i;
    collapseList.appendChild(newCollapse);
    prepareCollapse();

    i++;
}

function op_mp() {
    if (confirm("Вы точно хотите вернуться на главную страницу без сохранения результата?"))
        window.open("/", "_self");
}

function op_save() {
    window.open("/", "_self");
}

function nextMsg() {
    if (messages.length == 0) {
        op_save();
    } else {
        $('#add_save').html(messages.pop()).delay(1000).fadeOut(1000, nextMsg);
    }
};

var messages = [
    "Сохранено!",
].reverse();


async function setData(value) {
    document.getElementById('request-id').innerText = value['ID'];
    document.getElementById('request-date').innerText = value['ВремяДата'];
    document.getElementById('request-department').innerText = value['Цех'];
    document.getElementById('request-place').innerText = value['Места'];
    document.getElementById('request-person').innerText = value['Ответственный'];
    document.getElementById('request-desc').innerText = value['Описание'];
}

// как только документ прогрузится вызвать эти функции
document.addEventListener("DOMContentLoaded", function (event) {
    socket.emit('getOrderInfo', orderID);

    document.getElementById('to_mp').addEventListener('click', () => op_mp());
    document.getElementById('add_save').addEventListener('click', () => nextMsg());
    prepareCollapse();
    vehicleChoice();
    // - Добавим таймлайн


    /*timeline = new Timeline('timeline1', '2020-10-31', [{
                id: 1,
                group: 1,
                className: 'bold rounded',
                start: '11:00',
                end: '11:30'
            },
            {
                id: 2,
                group: 2,
                className: 'normal rounded',
                start: '11:30',
                end: '13:00'
            },
            {
                id: 3,
                group: 3,
                className: 'bold rounded',
                start: '13:00',
                end: '13:20'
            }
        ],
        groupNames = ['Подбивка', 'Промывка 30 м<sup>3</sup>', 'Отбивка']);


    timeline2 = new Timeline('timeline2', '2020-10-31', [{
        id: 1,
        group: 1,
        className: 'bold rounded',
        start: '11:00',
        end: '11:30'
		}], groupNames = ['Промывка 30 м<sup>3</sup>'], 'bottom');*/

});