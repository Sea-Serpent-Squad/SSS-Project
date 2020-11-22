// - Таймлайн класс для добавления на div таймлайна
// - Потом от него все элементы отнаследуем, добавим общие методы html
class DOMElement {
    constructor(id) {
        this.id = document.getElementById(id);
    }

    show() {
        this.id.style.display = '';
    }

    hide() {
        this.id.style.display = 'none';
    }
}

class Timeline extends DOMElement {
    // - Собираем переданные значения в массив для DataSet
    formDataSet(date, timeIntervals) {
        let timeLines = [];
        // это невидимый элемент, чтобы изначально таймлайн открывался с диапазоном 9:00 до 20:00
        timeIntervals.push({
            id: 666,
            group: 1,
            className: 'transparent',
            start: '09:00',
            end: '20:00'
        });
        // а теперь проходим по массиву из аргумента функции
        timeIntervals.forEach(element => {
            timeLines.push({
                id: element['id'],
                group: element['group'],
                className: element['className'],
                content: '',
                start: vis.moment.utc(new Date(`${date}T${element['start']}`)),
                end: vis.moment.utc(new Date(`${date}T${element['end']}`))
            });
        })

        return timeLines;
    }
    // - div = название элемента (прим., timeline1)
    // - date = дата (гггг-мм-дд), когда производится выполнение работ (прим., 2020-10-31)
    // - timeIntervals = временные отрезки, когда происходят работы. (прим., 11:00). Состоят из id, group, className, времяНачала, времяКонец
    // - orientation = ориентация у даты таймлайна, которая отображается над, под таймлайном, или не отображается вообще ('top','bottom','none' соответственно)
    // - min max считается автоматически из первого значения и устанавливают во сколько начинается рабочий день (31.10.2020 - 8:00 - 31.10.2020 - 20:00)
    // - GroupNames = название наших работ
    constructor(div,
        date,
        timeIntervals,
        groupNames,
        orientation = 'top',
    ) {
        super(div);
        this.items = new vis.DataSet(this.formDataSet(date, timeIntervals));

        let set = new Set();
        timeIntervals.forEach(element => {
            if (!set.has(element['group'])) set.add(element['group']);
        });
        let array = [];
        let i = 0;
        for (const element of set) array.push({
            id: element,
            content: groupNames[i++]
        });
        this.groups = new vis.DataSet(array);

        this.timeline = new vis.Timeline(this.id, null, {
            stack: false,
            zoomMin: 600000,
            stackSubgroups: true,
            orientation: orientation,
            min: new Date(`${date}T09:00`),
            max: new Date(`${date}T20:00`)
        });
        this.update();
    }

    // - Добавление элементов
    // - Группу нужно добавить, поэтому пересортируем имеющееся и добавим новую группу
    // - workName - название новой группы, в данном случае - название добавляемой работы, если оно не добавляется к имеющемуся
    addItem(date, item, workName = '') {
        let check = function (array, element) {
            for (const value of array) {
                if (value['id'] === element) return false;
            }
            return true;
        }

        if (check(this.groups.get(), item['group'])) {
            let arr = [...this.groups.get(), {
                id: item['group'],
                content: workName
            }].sort((a, b) => a.id - b.id).slice();
            this.groups.clear();
            arr.forEach(element => this.groups.add(element));
        }
        this.items.add(this.formDataSet(date, [item])[0]);
    }

    update() {
        this.timeline.setGroups(this.groups);
        this.timeline.setItems(this.items);
    }

    addGroup(group) {
        this.groups.add(group);
    }
}