const normalTicketsInp = document.querySelector('#normal-tickets');
const reducedTicketsInp = document.querySelector('#reduced-tickets');
const hoursInp = document.querySelector('#hours');
const kdrInp = document.querySelector('#kdr');
const submitInp = document.querySelector('#submit');
const info = document.querySelector('#info');

submitInp.addEventListener('click', evt => {
   evt.preventDefault();
   let sum = 0;
   let normalTicket = 10;
   let reducedTicket = 5;
   let allDayTicket = false;
   let intNormalTicketInp = parseInt(normalTicketsInp.value);
   let intReducedTicketInp = parseInt(reducedTicketsInp.value);
   let intHoursInp = parseInt(hoursInp.value);

   if (isNaN(intNormalTicketInp) || isNaN(intReducedTicketInp) || isNaN(intHoursInp)) {
       info.textContent = "Nie poprawne wartości!";
       return;
   } else if (intNormalTicketInp < 1 || intReducedTicketInp < 0 || intHoursInp < 1) {
       info.textContent = "Wpisałeś nie poprawne wartości!";
       return;
   } else if (intHoursInp > 24) {
       info.textContent = "Wpisałeś nie poprawne wartości!";
       return;
   }

   if (intHoursInp > 4) {
       normalTicket = 50;
       reducedTicket = 25;
       allDayTicket = true;
   }

   if (allDayTicket) {
       sum += normalTicket * intNormalTicketInp;
       sum += reducedTicket * intReducedTicketInp;
   } else {
       sum += normalTicket * intHoursInp * intNormalTicketInp;
       sum += reducedTicket * intHoursInp * intReducedTicketInp;
   }

   if (intReducedTicketInp >= 15) {
       let freeTickets = intReducedTicketInp / 15;
       for (let i = 0; i < intNormalTicketInp; i++) {
           sum -= normalTicket;
       }
   }

   if (kdrInp.checked) {
       sum *= 0.9;
   }

   info.textContent = `Zakupiono ${intReducedTicketInp} biletów ulgowych 
                        oraz ${intNormalTicketInp} biletów normalnych.
                        Całkowity koszt to ${sum}zł.`;
});