const inpTxt = document.querySelector('#input-text');
const outputTxt = document.querySelector('#output');
inpTxt.addEventListener('keyup', () => {
    console.log();
    if (inpTxt.value.indexOf(' ') > -1) {
        let txt = inpTxt.value.trim();
        const spacePos = inpTxt.value.indexOf(' ');
        outputTxt.textContent = txt[spacePos + 1] + txt.substring(1, spacePos) + ' ' + txt[0] + txt.substring(spacePos + 2);
    } else {
        outputTxt.textContent = inpTxt.value;
    }
});