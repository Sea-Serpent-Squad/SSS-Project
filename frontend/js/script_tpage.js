
function op_mp() {
    if (confirm("Вы точно хотите вернуться на главную страницу без сохранения результата?"))
        window.open("main_page.html", "_self")
}

function op_prev() {
    window.open("second_page.html", "_self")
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



// как только страница прогрузится
document.addEventListener("DOMContentLoaded", function (event) {
    // привяжем действия при клике на кнопки сортировки
    document.getElementById('to_mp').addEventListener('click',()=>op_mp());
    document.getElementById('to_prev').addEventListener('click',()=>op_prev());
    document.getElementById('add_save').addEventListener('click',()=>nextMsg());
});