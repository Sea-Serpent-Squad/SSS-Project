// - Таймлайн класс для добавления на div таймлайна
// - Потом от него все элементы отнаследуем, добавим общие методы html
class DOMElement
{
    constructor(id) {
        this.id = document.getElementById(id)
    }

    show()
    {
        this.id.style.display = ''
    }

    hide()
    {
        this.id.style.display = 'none'
    }
}

class Timeline extends DOMElement
{
    // - div = название элемента
    // - arrayTimelines - [ из объектов: ]
    // - options - опционально, но изначально дата сверху, min max считается автоматически из первого значения и устанавливают во сколько начинается рабочий день (31.10.2020 - 8:00 - 31.10.2020 - 20:00)
    constructor(div, arrayTimelines, options = {
        orientation: 'top'
    }) {
        super(div)
        this.items = new vis.DataSet(arrayTimelines);
        this.groups = new vis.DataSet();

        for (let i = 0; i < arrayTimelines.length; this.groups.add({id: i+1, content: ''}), i++);

        // - Установим начало - конец рабочего дня
        let date = () => arrayTimelines[0]['start'].toISOString().split('T')[0];

        options.min = new Date(`${date()}T09:00`)
        options.max = new Date(`${date()}T20:00`)

        this.timeline = new vis.Timeline(this.id, null, options);
        this.update()
    }

    // - Добавление элементов
    // - Группу нужно добавить, поэтому пересортируем имеющееся и добавим новую группу
    addItem(item)
    {
        this.items.add(item)
        this.addGroup({id: item.group, content:''})
        let newGroups = new Array();
        for (let i = 0; i < this.groups.length; i++)  newGroups.push(this.groups.get(i));
        newGroups.sort((a, b) => a.id - b.id);
        this.groups.clear();
        for (let i = 0; i < newGroups.length; i++)  this.groups.add(newGroups[i]);
    }

    update()
    {
        this.timeline.setGroups(this.groups)
        this.timeline.setItems(this.items)
    }

    addGroup(group)
    {
        this.groups.add(group)
    }
}