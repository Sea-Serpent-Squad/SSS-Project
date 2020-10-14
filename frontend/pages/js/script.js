
// пройдемся во всей виртуальной технике и привяжем реакцию на событие, т.е сделаем, чтобы при нажатии на вирт. технику она выделялась кружком (selected vehicle)
// и соответственно выделение снималось, когда нажали на другую вирт. технику (или на ту же самую еще один раз)
function prepareCollapse()
{
    document.querySelectorAll(".vehicle").forEach((elem) => {
        // при клике скрываем текущий открытый блок div collapse
        $(elem).on('click', () => {
            $('.collapse.show').collapse('hide');
        });
        // выделяем кружком и блокируем нажатия на ссылки пока не раскроется блок с настоящ. техникой
        $(elem.getAttribute("href")).on('show.bs.collapse', () => {
            elem.children[0].classList.add("selected");
            document.querySelectorAll(".vehicle").forEach((elem) => { elem.classList.add("no-link") });
        });
        // как только раскрылся, включаем ссылки обратно
        $(elem.getAttribute("href")).on('shown.bs.collapse', () => {
            document.querySelectorAll(".vehicle").forEach((elem) => { elem.classList.remove("no-link") });
        });
        // убираем кружок при закрытии блока с техникой
        $(elem.getAttribute("href")).on('hide.bs.collapse', () => {
            elem.children[0].classList.remove("selected");
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
        let newRow = document.createElement("dl");
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

// как только документ прогрузится вызвать эти функции
$(document).ready(() => {
    prepareCollapse();
    addNewVehicle();
});



