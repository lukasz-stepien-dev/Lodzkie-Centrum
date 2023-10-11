const amountInpEx6 = document.querySelector('#amount-ex6');
const premiumInp = document.querySelector('#premium');
const info = document.querySelector('#info-ex6');
const kmInp = document.querySelector('#km');
const regularPrice = 2;
const premiumRate = 1.3;
const regularWeight = 1.5;
const premiumWeight = 1.75;
const transportPrice = 0.5;
document.querySelector('#calculate-ex6').addEventListener('click', () => {
    info.textContent = `Zakupiono: ${amountInpEx6.value},`;
    if (premiumInp.checked) {
        info.textContent += ` cegły premium,`
        let price = amountInpEx6.value * regularPrice * premiumRate + ((amountInpEx6.value * premiumWeight) / 10 * transportPrice * kmInp.value);
        info.textContent += ` koszt: ${price}, koszt transportu ${(amountInpEx6.value * premiumWeight) / 10 * transportPrice * kmInp.value}`;
    } else {
        info.textContent += ` cegły standardowej,`
        let price = amountInpEx6.value * regularPrice + ((amountInpEx6.value * regularWeight) / 10 * transportPrice * kmInp.value);
        info.textContent += ` koszt: ${price}, koszt transportu ${(amountInpEx6.value * regularWeight) / 10 * transportPrice * kmInp.value}`;
    }
})