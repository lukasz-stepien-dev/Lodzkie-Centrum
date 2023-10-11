const numb1 = document.querySelector('#numb-1');
const numb2 = document.querySelector('#numb-2');
const numb3 = document.querySelector('#numb-3');

numb3.addEventListener('keyup', () => {
    const numbs = [parseInt(numb1.value), parseInt(numb2.value), parseInt(numb3.value)];
    document.querySelector('#numbs').innerHTML =
        `Największa liczba: ${Math.max(numbs[0], numbs[1], numbs[2])}<br>` +
        `Najmniejsza liczba: ${Math.min(numbs[0], numbs[1], numbs[2])}`;

})