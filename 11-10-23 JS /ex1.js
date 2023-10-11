const chancePara = document.querySelector('#chance');
document.querySelector('#check-btn').addEventListener('click', () => {
    const chance = Math.floor(Math.random() % 100 * 100 + 1);
    chancePara.textContent = "" +
        `Prawdopodobieństwo, że tak będzie wynosi: ${chance}`;
    chancePara.className = '';
    if (chance < 34) {
        chancePara.classList.add('red');
    } else if (chance > 33 && chance < 67) {
        chancePara.classList.add('blue');
    } else if (chance > 66) {
        chancePara.classList.add('green');
    }
});