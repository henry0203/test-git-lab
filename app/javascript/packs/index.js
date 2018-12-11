const tabCurrent = document.getElementById('current_tab');
const tabMyBooking = document.getElementById('my_booking_tab');

const contentCurrent = document.getElementById('current_message');
const contentMyBooking = document.getElementById('my_booking_message');

contentCurrent.hidden = false;

if (tabCurrent) {
  tabCurrent.addEventListener('click', (event) => {
    tabCurrent.classList.add("active");
    tabMyBooking.classList.remove("active");$
    contentCurrent.hidden = false;
    contentMyBooking.hidden = true;
  })
  tabMyBooking.addEventListener('click', (event) => {
    tabMyBooking.classList.add("active");
    tabCurrent.classList.remove("active");
    contentCurrent.hidden = true;
    contentMyBooking.hidden = false;
  })
}



