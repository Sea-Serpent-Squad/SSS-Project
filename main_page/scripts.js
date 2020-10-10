/* Просто проверка что можно нажимать на строки и получать данные */


function highlight_row() {
    /*let table = document.getElementById('display-table');
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
                rowsNotSelected[row].style.backgroundColor = "";
                rowsNotSelected[row].classList.remove('selected');
            }
            let rowSelected = table.getElementsByTagName('tr')[rowId];
            rowSelected.style.backgroundColor = "yellow";
            rowSelected.className += " selected";

            let msg = 'The ID of the company is: ' + rowSelected.cells[0].innerHTML;
            msg += '\nThe cell value is: ' + this.innerHTML;
            alert(msg);
        }
    }*/
    window.open("third_page.html","_self");
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
function td_stled_mp(text) {
    let td = document.createElement("TD");
    td.innerHTML = text;
    text.search('status') == -1 ? td.style.textAlign = "center" : td.align = "center";
    td.class = "td_mp";
    return td;
}

/* Функция добавления строки таблицы */
function addRow()
{
    let tbody = document.getElementById("display-table").getElementsByTagName("TBODY")[0];
    let row = document.createElement("TR");

    row.appendChild(td_stled_mp(' <span class="status red_col"></span> '));
    row.appendChild(td_stled_mp('20-10-5'));
    row.appendChild(td_stled_mp('Завоз воды'));
    row.appendChild(td_stled_mp('ПСП, УКПГ'));
    row.appendChild(td_stled_mp('8:00 - 20:00'));
    row.appendChild(td_stled_mp('<span class="ceh_block ceh_green">ДСУ</span>'));

    tbody.appendChild(row);
}