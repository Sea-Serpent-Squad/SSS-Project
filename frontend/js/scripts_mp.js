 // глобальные переменные, потом добавим в класс
 let figureWas = 'sortFigSt'; // Figure of down/up was
 let downSight = true; // true - DOWN, false - UP
 // - Флаг где был видел знак и в какую сторону стрелка у значка
 // - Для замены вверх/вниз
 const figureDOWN = 'fas fa-sort-amount-down-alt'; // to put figure
 const figureUP = 'fas fa-sort-amount-up-alt';



 // как только страница прогрузится
 document.addEventListener("DOMContentLoaded", function (event) {
     // привяжем действия при клике на кнопки сортировки
     document.querySelectorAll(".th-mp").forEach((elem) => {
         let id = elem.querySelector('span').getAttribute('id');
         elem.addEventListener('click', () => headerValue_click(id));
     });
    // привяжем добавление строки к кнопке
     document.getElementById("add_row_btn").addEventListener('click', ()=>addRow());
     // установим сортировку по № при стартовой загрузке страницы
     headerValue_click('sortFigN');
     // и вызовем highlight_row
     highlight_row();
     /* выводим текущую дату и время на сайт в блок с id "current_date_time_block" */
     document.getElementById('current_date_time_block').innerHTML = date_time();
     /* привяжем событие ввода текста к фильтру таблицы */ 
     document.getElementById("search-edit").addEventListener('input', setFilter);
     /* Событие у ввода фильтра в input[text] это такой же фильтр, как и выбор приоритета, поэтому у них один обработчик установки фильтра */
     document.getElementById("filter-priority").addEventListener('change', setFilter); 
 });

 //  - Проверка нахождения в строке
 function isTdContainFiler(td, enter) {
    return td.innerHTML.toUpperCase().indexOf(enter) > -1;
 }

 // - Сделать какие то строки видимыми, а какие то нет
 // - Соответственно необходимо учитывать как приоритет, так и номер
 function setFilter(i = 0) {
     console.clear();
     let td, selectedClass = document.getElementById("inlineFormCustomSelect").value;
     // - Строка в таблице
     const tr = document.getElementById("app_table").getElementsByTagName("tr");
     // - Фильтр в строке
     const enter = document.getElementById("search-edit").value.toUpperCase().trimStart().trimEnd();
     // - Какой приоритет выбран
     let priority_type = document.getElementById("inlineFormCustomSelect")[selectedClass-1].className
     for (i = 0; i < tr.length; ++i)
     {
         // - Получим номер заявки
         td = tr[i].getElementsByTagName("td")[1];
         if (td)
         {
             // - Проверим содержит ли строка нужный нам номер по фильтру
             if (isTdContainFiler(td, enter)){
                 // - Если содержит проверим подходит ли нам заявка по приоритету (если его нет или если он как у заявки)
               if (priority_type.length == 0 || tr[i].classList.contains(priority_type))  tr[i].style.display = "";
               // - Иначе заявку нужно скрыть
               else tr[i].style.display = "none";
             } else {
                 // - Строка не подходит по фильтру в input[text], скрываем и ее
                 tr[i].style.display = "none";
             }
            }
     }
 }

 /* Просто проверка что можно нажимать на строки и получать данные */
 function highlight_row() {
     let table = document.getElementById('app_table');
     let cells = table.getElementsByTagName('td');

     for (let i = 0; i < cells.length; i++) {
         // Take each cell
         let cell = cells[i];
         // do something on onclick event for cell
         cell.onclick = function () {
             // Get the row id where the cell exists
             let rowId = this.parentNode.rowIndex;

             let rowsNotSelected = table.getElementsByTagName('tr');
             for (let row = 0; row < rowsNotSelected.length; row++) {
                 ///rowsNotSelected[row].style.backgroundColor = "";
                 ///rowsNotSelected[row].classList.remove('selected');
             }
             let rowSelected = table.getElementsByTagName('tr')[rowId];
             //rowSelected.style.backgroundColor = "";
             //rowSelected.className += " ";

             window.open("second_page.html", "_self");
         }
     }
 }

 setInterval(function () {
     document.getElementById('current_date_time_block').innerHTML = date_time();
 }, 1000);

 /* функция добавления ведущих нулей */
 /* (если число меньше десяти, перед числом добавляем ноль) */
 function zero_first_format(value) {
     if (value < 10) {
         value = '0' + value;
     }
     return value;
 }

 /* функция получения текущей даты и времени */
 function date_time() {
     const current_datetime = new Date();
     const day = zero_first_format(current_datetime.getDate());
     const month = zero_first_format(current_datetime.getMonth() + 1);
     const year = current_datetime.getFullYear();
     const hours = zero_first_format(current_datetime.getHours());
     const minutes = zero_first_format(current_datetime.getMinutes());
     const seconds = zero_first_format(current_datetime.getSeconds());

     return day + "." + month + "." + year + " " + hours + ":" + minutes + ":" + seconds;
 }

 /* Создание элемента для вставки */
 function create_td_value(text) {
     const td = document.createElement("TD");
     td.innerHTML = text;
     text.search('status-big') == -1 ? td.style.textAlign = "center" : td.align = "center";
     td.class = "td-mp";
     return td;
 }

 /* Функция добавления строки таблицы */
 function addRow() {
     let tbody = document.getElementById("app_table").getElementsByTagName("TBODY")[0];
     let row = document.createElement("TR");

     row.appendChild(create_td_value('<span class="status-big new-col"></span>'));
     row.appendChild(create_td_value('20-10-5'));
     row.appendChild(create_td_value('Завоз воды'));
     row.appendChild(create_td_value('ПСП, УКПГ'));
     row.appendChild(create_td_value('8:00 - 20:00'));
     row.appendChild(create_td_value('ДСУ'));
     row.setAttribute("border", "1px solid rgba(0, 0, 0, 0.25)");
     row.className = "priority-low";
     tbody.appendChild(row);
     // - Сразу проверим показывать ли строку или нет
     setFilter(tbody.rows.length-1);
 }

 // - Получить элемент по ID
 function getElementByText(text) {
     return document.getElementById(text);
 }

 // - Вывести иконку сортировки по возрастанию или по убыванию
 function headerValue_click(text) {
     let element_before = getElementByText(figureWas);
     element_before.style.visibility = 'hidden';
     element_before.className = figureDOWN;
     let element = getElementByText(text);
     if (figureWas == text) {
         if (downSight) {
             element.className = figureUP;
         } else {
             element.className = figureDOWN;
         }
         downSight = element.className == figureUP ? false : true;
     } else {
         downSight = true;
     }
     element.style.visibility = 'visible';
     figureWas = text;
 }
