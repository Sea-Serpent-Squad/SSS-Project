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

            window.open("second_page.html","_self");
            alert(msg);
        }
    }
}
setInterval(function () {
    document.getElementById('current_date_time_block').innerHTML = date_time();
}, 1000);

    /* функция добавления ведущих нулей */
    /* (если число меньше десяти, перед числом добавляем ноль) */
    function zero_first_format(value)
    {
        if (value < 10)
        {
            value='0'+value;
        }
        return value;
    }

/* функция получения текущей даты и времени */
function date_time()
{
    const current_datetime = new Date();
    const day = zero_first_format(current_datetime.getDate());
    const month = zero_first_format(current_datetime.getMonth()+1);
    const year = current_datetime.getFullYear();
    const hours = zero_first_format(current_datetime.getHours());
    const minutes = zero_first_format(current_datetime.getMinutes());
    const seconds = zero_first_format(current_datetime.getSeconds());

    return day+"."+month+"."+year+" "+hours+":"+minutes+":"+seconds;
}

/* выводим текущую дату и время на сайт в блок с id "current_date_time_block" */
document.getElementById('current_date_time_block').innerHTML = date_time();

/* Создание элемента для вставки */
function create_td_value(text) {
    const td = document.createElement("TD");
    td.innerHTML = text;
    text.search('status') == -1 ? td.style.textAlign = "center" : td.align = "center";
    td.class = "td_mp";
    return td;
}

/* Функция добавления строки таблицы */
function addRow()
{
    let tbody = document.getElementById("app_table").getElementsByTagName("TBODY")[0];
    let row = document.createElement("TR");

    row.appendChild(create_td_value('<span class="status_mp new-col"></span>'));
    row.appendChild(create_td_value('20-10-5'));
    row.appendChild(create_td_value('Завоз воды'));
    row.appendChild(create_td_value('ПСП, УКПГ'));
    row.appendChild(create_td_value('8:00 - 20:00'));
    row.appendChild(create_td_value('ДСУ'));
    row.setAttribute("border","1px solid rgba(0, 0, 0, 0.25)");
    row.className = "priority_low";
    tbody.appendChild(row);
}

// - Получить элемент по ID
function getElementByText(text)
{
    return document.getElementById(text);
}

// - Вывести иконку сортировки по возрастанию или по убыванию
function headerValue_click(text) {
    getElementByText(figureWas).style.visibility = 'hidden';
    let element = getElementByText(text);
    if (figureWas == text)
    {
        if (downSight)
        {
            element.className = figureUP;
            downSight = false;
        } else
        {
            element.className = figureDOWN;
            downSight = true;
        }
    } else
    {
        downSight = true;
    }
    element.style.visibility = 'visible';
    figureWas = text;
}




