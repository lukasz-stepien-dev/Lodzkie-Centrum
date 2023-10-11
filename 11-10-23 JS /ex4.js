const input = document.querySelector('#input-ex4');
const output = document.querySelector('#out-ex4');
input.addEventListener('keyup', () => {
    const text = input.value;
    const length = text.length;
    let textOut;
    output.textContent = "";
    if (length < 6) {
        output.textContent += "Wyraz nie ma 6 znaków ";
    } else if (length >= 6) {
        output.textContent += "Wyraz ma 6 znaków ";
    }

    if (text.substring(length-3) === 'kot') {
        output.textContent += 'i zawiera słowo "kot".';
    } else if(text.substring(length-3) === 'kot') {
        output.textContent += 'i zawiera słowo "kot".';
    }
});