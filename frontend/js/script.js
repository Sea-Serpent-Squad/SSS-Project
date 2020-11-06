
// пройдемся во всей виртуальной технике и привяжем реакцию на событие, т.е сделаем, чтобы при нажатии на вирт. технику она выделялась кружком (selected vehicle)
// и соответственно выделение снималось, когда нажали на другую вирт. технику (или на ту же самую еще один раз)
function prepareCollapse()
{
    document.querySelectorAll(".virt-vehicle").forEach((elem) => {
        // при клике скрываем текущий открытый блок div collapse
        $(elem).on('click', () => {
            $('.collapse.show').collapse('hide');
        });
        // выделяем кружком и блокируем нажатия на ссылки пока не раскроется блок с настоящ. техникой
        $(elem.getAttribute("href")).on('show.bs.collapse', () => {
            elem.children[0].classList.add("selected");
            document.querySelectorAll(".virt-vehicle").forEach((elem) => { elem.classList.add("no-link") });
        });
        // как только раскрылся, включаем ссылки обратно
        $(elem.getAttribute("href")).on('shown.bs.collapse', () => {
            document.querySelectorAll(".virt-vehicle").forEach((elem) => { elem.classList.remove("no-link") });
        });
        // убираем кружок при закрытии блока с техникой
        $(elem.getAttribute("href")).on('hide.bs.collapse', () => {
            elem.children[0].classList.remove("selected");
        });
    });
}

function vehicleChoice()
{
    let arr = Array.from(document.querySelector("#list-of-free-vehicles-1").children);
    arr.forEach((elem) => {
        elem.children[0].addEventListener('click', () => {
            let veh = document.querySelector('a[href="#vehicle1"]');
            veh.children[1].innerText = elem.children[0].innerText;
            veh.parentElement.children[2].insertAdjacentHTML('afterbegin',"Дорога<br>");
            veh.classList.add("text-primary");
            let driver_row = veh.parentElement.nextElementSibling;
            driver_row.classList.remove("disabled"); 
            /* На этом месте мы добавляем в таймлайн дорогу */
            veh.click();
        });
    });
}

// добавление виртуальной техники по кнопке
let vehicleCount = 2;

// эта функция привязывает добавление новой вирт. техники к кнопке
function addNewVehicle()
{
    document.getElementById("btn-create").addEventListener('click', () => {
        // закрываем открытый блок collapse
        $('.collapse.show').collapse('hide');
        // формируем новую строку в списке вирт. техники (копируя первую виртуальную технику)
        let list = document.getElementById("virt-list-of-vehicles");
        let newRow = document.createElement("div");
        newRow.className = "row mt-5";
        newRow.innerHTML = list.children[1].innerHTML;
        // теперь меняем значения
        let vehicleName = newRow.children[0];
        let vehiclePlace = newRow.children[1];
        let vehicleOper = newRow.children[2];
        vehicleName.setAttribute("href","#vehicle" + (++vehicleCount));
        vehicleName.children[1].innerHTML = "ВТ" + vehicleCount + ": Сгенерированная техника";
        vehiclePlace.innerHTML = "unknown place";
        vehicleOper.innerHTML = "unknown operation";
        list.insertBefore(newRow,list.lastElementChild);
        let collapseList = document.getElementById("collapse-list-of-vehicles");
        let newCollapse = document.createElement("div");
        newCollapse.className = "collapse";
        newCollapse.setAttribute("id","vehicle" + vehicleCount);
        newCollapse.innerHTML = collapseList.children[0].innerHTML;
        newCollapse.children[0].innerText = "Невиртуальная сгенерированная техника №" + vehicleCount;
        collapseList.appendChild(newCollapse);
        prepareCollapse();
    });
}










// 3 мусор
function op_mp() {
    if (confirm("Вы точно хотите вернуться на главную страницу без сохранения результата?"))
    window.open("main_page.html", "_self")
}

function op_save() {
    window.open("main_page.html", "_self")
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

// как только документ прогрузится вызвать эти функции
$(document).ready(() => {
    document.getElementById('to_mp').addEventListener('click',()=>op_mp());
    document.getElementById('add_save').addEventListener('click',()=>nextMsg());
    prepareCollapse();
    addNewVehicle();
    vehicleChoice();
});
