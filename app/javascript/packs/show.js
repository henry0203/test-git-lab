$(function() {
  $('#datetimepicker').datetimepicker();
  $('#datetimepicker2').datetimepicker();
  $('#datetimepicker3').datetimepicker();
  $('#datetimepicker4').datetimepicker();
});

const dateBegin = document.getElementById('datetimepicker3');
const dateEnd = document.getElementById('datetimepicker4');
const restDiv = document.querySelector('.rest-div');
const price = document.querySelector('.calculated-price');
const pricePerDay = document.getElementById('price-per-day');
const amount = document.getElementById('amount');

const bigArray = [];

dateEnd.addEventListener('blur', (event) => {
  var begin = dateBegin.value;
  var end = dateEnd.value;
  var q = 1;
  q = 1;
  if (begin.length !== 0 && end.length !== 0) {
    var array = [begin, end];
    array.forEach((elem, index) => {
      elem = elem.split('');
      if (elem.length === 18) {
        const ind = [2, 5, 10, 12, 15, 17];
        ind.forEach((i) => {
          delete elem[i];
        });
        if (elem[16] === "P") {
          elem = elem.join('');
          const month = Number.parseInt(elem.substr(0, 2), 10)-1;
          const day = elem.substr(2, 2);
          const year = elem.substr(4, 4);
          elem = Number.parseInt(Date.parse(new Date(year, month, day)), 10);
        } else {
          elem = elem.join('');
          const month = Number.parseInt(elem.substr(0, 2), 10)-1;
          const day = elem.substr(2, 2);
          const year = elem.substr(4, 4);
          elem = Number.parseInt(Date.parse(new Date(year, month, day)), 10);
        };
      } else if (elem.length === 19) {
        const ind = [2, 5, 10, 13, 16, 18];
        ind.forEach((i) => {
          delete elem[i];
        });
        if (elem[17] === "P") {
          elem = elem.join('');
          const month = Number.parseInt(elem.substr(0, 2), 10)-1;
          const day = elem.substr(2, 2);
          const year = elem.substr(4, 4);
          elem = Number.parseInt(Date.parse(new Date(year, month, day)), 10);
        } else {
          elem = elem.join('');
          const month = Number.parseInt(elem.substr(0, 2), 10)-1;
          const day = elem.substr(2, 2);
          const year = elem.substr(4, 4);
          elem = Number.parseInt(Date.parse(new Date(year, month, day)), 10);
        };
      };
      array[index] = elem;
    });
    const numberOfDays = Math.round((array[1] - array[0]) / 86000000);
    array.push(numberOfDays);
  };
  if (q === 1) {
    q += 1;
    bigArray.push(array);
  }
  console.log(bigArray);
  if (dateBegin.value.length !== 0 && dateEnd.value.length !== 0) {
    const priceDay = pricePerDay.innerText.match(/([0-9]+)/)[0]
    const totalPrice = Number.parseInt(priceDay, 10)*Number.parseInt(bigArray[bigArray.length-1][2]);
    price.innerHTML = `<p>${priceDay}€ x ${bigArray[bigArray.length-1][2]} days</p>
    <p><strong>Total :</strong> ${totalPrice} €</p>`
    amount.value = totalPrice;
    console.log(amount);
  }
  test_date();
});

const test_date = () => {
  let result = true;
  const array_booking_date = []
document.querySelectorAll('.booking_date').forEach((element) => { array_booking_date.push(element.value.substr(0,10)); });
  array_booking_date.forEach((element) => {
    if (element === dateBegin.value.substr(0,10) || element === dateEnd.value.substr(0,10) ) {
      price.innerHTML = `The dates selected are wrong</p>`
      result = false;
    }
  });
  return result;
};





















