// пройдемся во всей виртуальной технике и привяжем реакцию на событие, т.е сделаем, чтобы при нажатии на вирт. технику она выделялась кружком (selected vehicle)
// и соответственно выделение снималось, когда нажали на другую вирт. технику (или на ту же самую еще один раз)

const socket = io.connect('', {
    'forceNew': true,
    'reconnection': false
});

// - будем запоминать массивы с занятыми водилами каждый с очередностью
const busyDriversList = new Map()
const ordersRealizeTime = new Map()

const orderID = window.location.href.split('/')[4];

let orderCount = 1;

socket.on('setAppOrderFreeDrivers', (AppOrderDriversList) =>
{
    getFreeDriversOnAppAndOrder(AppOrderDriversList);
});

socket.on('setOrderStartEndDuration', orderInfo =>
{
    saveOrderInfo(orderInfo)
});

socket.on('setOrderHeaderInfo', (data) => {
    setOrderHeaderInfo(data);
});

socket.on('setVirtVehicleInfo', ({index, virtVehicle}) => {
    setVirtVehicleInfo(index, virtVehicle);
});

socket.on('setRealVehiclesInfo', ({index, realVehicles}) => {
    setRealVehiclesInfo(index, realVehicles);
    prepareCollapse();
    document.querySelector("a[href='#vehicle0']").click();
    document.getElementById("collapse-list-of-vehicles").classList.remove('disabled');
});

socket.emit('takeOrderMutex', orderID);

socket.on('disconnect', () => {
    setTimeout(() => {
        alert("Потеряно соединение с сервером. Несохраненные данные были потеряны.");
        document.location.reload();
    }, 2000);
});

let timelines = [];
let globalDate = "";

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


async function setOrderHeaderInfo(value) {
    document.getElementById('request-id').innerText = value['ID'];
    document.getElementById('request-date').innerText = value['ВремяДата'];
    document.getElementById('request-department').innerText = value['Цех'];
    document.getElementById('request-place').innerText = value['Места'];
    document.getElementById('request-person').innerText = value['Ответственный'];
    document.getElementById('request-desc').innerText = value['Описание'];
}

function getParsedValues(timeline) {
    let collection = [];
    for (let i = 0; i < timeline.length; ++i) {
        collection.push({
            id: i,
            group: i+1,
            className: 'bold rounded',
            start: timeline[i]['Начало'],
            end: timeline[i]['Конец']
        })
    }
    return collection;
}

async function getFreeDriversOnAppAndOrder(AppOrderDriversList)
{
   await busyDriversList.set(AppOrderDriversList['ord'], AppOrderDriversList['values']);
   socket.emit('getOrderStartEndDuration', orderID, AppOrderDriversList['ord']);
   await addDrivers(AppOrderDriversList);
}

async function saveOrderInfo(orderInfo)
{
    ordersRealizeTime.set(orderInfo['Очередность'],
        {
            Начало: orderInfo['Начало'],
            Конец: orderInfo['Конец'],
            Длительность: orderInfo['Длительность']
        })
}

// добавить виртуальную технику на страницу
async function setVirtVehicleInfo(index, virtVehicle)
{
    // название виртуальной техники и место работы
    let parent = document.querySelector('#virt-list-of-vehicles');
    let data = document.createElement('dl');
    data.className = `row mt-5`;
    data.id = `technica${index+1}`
    let autoLink = document.createElement('a');
    autoLink.className = 'virt-vehicle col-3 m-auto';
    autoLink.setAttribute("data-toggle", 'collapse');
    autoLink.setAttribute("role", 'button');
    autoLink.role = 'button';
    autoLink.href = `#vehicle${index}`;
    autoLink.innerHTML = `<span></span><span>${virtVehicle['Техника']}</span>`;
    let location = document.createElement('dd');
    location.className = 'col-2 m-auto';
    location.innerHTML = `${virtVehicle['Локация']}`;
    // html контейнер dd для таймлайна с задачами
    let timeline = document.createElement('dd');
    timeline.className = 'col-7 m-auto';
    timeline.id = `timeline${index}`;
    // все присоединяем
    data.append(autoLink);
    data.append(location);
    data.append(timeline);
    parent.append(data);

    // формируем таймлайн для виртуальной техники
    let groups = [];
    virtVehicle['Таймлайн'].forEach(singleTask => {
        groups.push(singleTask['Работа']);
    });
    globalDate = virtVehicle['Таймлайн'][0]['Начало'].split(' ')[0];
    timelines.push(new Timeline(`timeline${index}`, globalDate,
        getParsedValues(virtVehicle['Таймлайн']), groups));

    // - добавление инфы о количестве очердностей

}

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

function driverToSelect(id)
{

    console.log(id)
}

async function addDrivers(ind)
{
    let data = document.createElement('dl')
    data.className = 'row mt-5 disabled';
    data.id = `driverOf${ind['ord']}`
    let drivers = document.createElement('div')
    drivers.className = 'col-3 font-weight-bold';
    drivers.innerText = 'Исполнитель'

    data.appendChild(drivers)

    let dddrivers = document.createElement('dd')
    dddrivers.className = 'col-2'
    let selections = document.createElement('select')
    selections.className = 'custom-select mr-sm-2 text-center'
    selections.id = `inlineFormCustom${ind['ord']}`
    await selections.addEventListener('change', () => console.log(selections.id))
    let names = ind['values']

    names.forEach((element, index) =>
    {
        let child = document.createElement('option')
        child.value = index+1
        child.innerText = element['ФИО']
        selections.appendChild(child)
    })

    dddrivers.appendChild(selections);
    data.appendChild(dddrivers);
    const tech = document.querySelector(`#technica${ind['ord']}`);
    tech.parentNode.insertBefore(data, tech.nextSibling);
}

async function vehicleChoice(index, date, start, end) {
    let arr = Array.from(document.querySelectorAll(`div > #list-of-free-vehicles-${index} a`));
    arr.forEach((elem, indexed) => {
        elem.addEventListener('click', () => {
            let veh = document.querySelector(`a[href="#vehicle${index}"]`);
            veh.children[1].innerText = elem.innerText;
            veh.classList.add("text-primary");
            //let driver_row = veh.parentElement.nextElementSibling;
            //driver_row.classList.remove("disabled");
            /* Вставка таймлайна с дорогой*/
            timelines[index].addItem(date, {
                id: timelines[0].iOfLastElem,
                group: 0,
                className: 'drive',
                start: start,
                end: end
            }, 'Дорога')
            document.querySelector(`#driverOf${index+1}`).classList.remove('disabled')
           veh.click();
        });
    });
   socket.emit('getFreeDriverList', orderID, orderCount++);
}

async function setRealVehiclesInfo(index, realVehicles) {

    let collapseList = document.getElementById("collapse-list-of-vehicles");
    collapseList.classList.add('disabled');
    let newCollapse = document.createElement("div");
    newCollapse.className = "collapse show";
    newCollapse.setAttribute("id", "vehicle" + index);

    let containerDiv = document.createElement("div");
    containerDiv.className = "container mt-4 app-back-panel";
    newCollapse.append(containerDiv);

    let innerContainerDiv = document.createElement("div");
    innerContainerDiv.className = "row mt-3 mb-5";
    containerDiv.append(innerContainerDiv);

    let listOfVehicles = document.createElement("div");
    listOfVehicles.className = "col-3 ml-2";
    listOfVehicles.id = `list-of-vehicles-${index}`;
    innerContainerDiv.append(listOfVehicles);

    let listOfFreeVehicles = document.createElement("div");
    listOfFreeVehicles.id = `list-of-free-vehicles-${index}`;
    listOfVehicles.append(listOfFreeVehicles);
    let listOfFreeVehiclesTitleRow = document.createElement("div");
    listOfFreeVehiclesTitleRow.className = "row mt-1";
    listOfFreeVehicles.append(listOfFreeVehiclesTitleRow);
    let listOfFreeVehiclesTitle = document.createElement("div");
    listOfFreeVehiclesTitle.className = "col mb-4";
    listOfFreeVehiclesTitle.innerText = "Свободная техника";
    listOfFreeVehiclesTitleRow.append(listOfFreeVehiclesTitle);
    let listOfBusyVehicles = document.createElement("div");
    listOfBusyVehicles.id = `list-of-busy-vehicles-${index}`;
    let listOfBusyVehiclesTitleRow = document.createElement("div");
    listOfBusyVehiclesTitleRow.className = "row mt-5";
    listOfBusyVehicles.append(listOfBusyVehiclesTitleRow);
    let listOfBusyVehiclesTitle = document.createElement("div");
    listOfBusyVehiclesTitle.className = "col mb-4";
    listOfBusyVehiclesTitle.innerText = "Занятая техника";
    listOfBusyVehiclesTitleRow.append(listOfBusyVehiclesTitle);
    listOfVehicles.append(listOfBusyVehicles);

    let groupsFree = [];
    let timelinePointsFree = [];
    for (const vehicle of realVehicles)
    {
        let vehicleDiv = document.createElement("div");
        vehicleDiv.className = "row mt-4";
        let vehicleLink = document.createElement("a");
        vehicleLink.className = "col font-weight-bold";
        vehicleLink.innerText = vehicle['Название'];
        vehicleDiv.append(vehicleLink);
        let isBusy = vehicle['Занято'];
        if (isBusy) listOfBusyVehicles.append(vehicleDiv);
        else
        {
            groupsFree.push(vehicle['Название']);
            if (vehicle['ТочкаМаршрута'].length > 0)
            {
                timelinePointsFree.push(vehicle['ТочкаМаршрута']);
            }
            timelinePointsFree.push({Начало: '2020-10-31 10:00', Конец: '2020-10-31 10:30'});
            listOfFreeVehicles.append(vehicleDiv);
        }
    }
    // таймлайны
    let listOfTimelines = document.createElement("div");
    listOfTimelines.className = "col ml-2";
    innerContainerDiv.append(listOfTimelines);

    let timelineFreeTitleRow = document.createElement("div");
    timelineFreeTitleRow.className = "row mt-1";
    listOfTimelines.append(timelineFreeTitleRow);
    let timelineFreeTitle = document.createElement("div");
    timelineFreeTitle.className = "col mb-4";
    timelineFreeTitle.innerText = "Операция-время";
    timelineFreeTitleRow.append(timelineFreeTitle);

    let timelineFree = document.createElement("div");
    timelineFree.className = "col";
    timelineFree.id = `timelineFreeRealVeh${index}`;
    listOfTimelines.append(timelineFree);

    let timelineBusy = document.createElement("div");
    timelineBusy.className = "col";
    timelineBusy.id = `timelineBusyRealVeh${index}`;
    listOfTimelines.append(timelineBusy);
    collapseList.appendChild(newCollapse);
    await vehicleChoice(index, globalDate, '2020-10-31 10:00', '2020-10-31 11:00');
    let freeTimeline = new Timeline(`timelineFreeRealVeh${index}`, globalDate, getParsedValues(timelinePointsFree), groupsFree);

}

// как только документ прогрузится вызвать эти функции
document.addEventListener("DOMContentLoaded", function (event) {
    socket.emit('getOrderInfo', orderID);
    //socket.emit('getTimelineInfo', orderID);
    document.getElementById('to_mp').addEventListener('click', () => op_mp());
    document.getElementById('add_save').addEventListener('click', () => nextMsg());
    //prepareCollapse();
});