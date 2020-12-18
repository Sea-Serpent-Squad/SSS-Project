module.exports = class mutex
{
    constructor() {
        this.orders = new Set()
    }

    addOrder(id){
        this.orders.add(id)
    }

    deleteOrder(id)
    {
        this.orders.delete(id)
    }

    isBusy(id)
    {
        return this.orders.has(id);
    }

    testReset()
    {
        this.orders.clear()
    }
}