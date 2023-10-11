const amountInp = document.querySelector('#amount');
const clientInp = document.querySelector('#client');
const prices = [2, 1.5, 1];

document.querySelector('#calculate').addEventListener('click', () => {
    let price = 0.0;
    if (amountInp.value < 51 && amountInp.value > 1) {
        price = parseInt(amountInp.value) * prices[0];
    } else if (amountInp.value >= 50 && amountInp.value < 101) {
        price = parseInt(amountInp.value) * prices[1];
    } else if (amountInp.value > 100) {
        price = 100 * prices[1];
        price += (parseInt(amountInp.value) - 100) * prices[2];
    }

    if (clientInp.checked) {
        price *= 0.8;
    }

    document.querySelector('#price-ex5').textContent = `${Math.round(price * 100) / 100}`;
})