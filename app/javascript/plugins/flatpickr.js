import flatpickr from 'flatpickr'
require("flatpickr/dist/themes/material_green.css");

flatpickr(".datepicker", {  altInput: true,
                            enableTime: false,
                            minDate: "today"
});





// validation that the end date must be greater than the start date

let startDate = document.getElementById("booking_start_date");
let endDate =  document.getElementById("booking_end_date");
const form = document.getElementById("new_booking");

form.addEventListener("change",(event) => {

  // console.log(startDate.value > endDate.value);
  if (startDate.value >= endDate.value && startDate.value != '' && endDate.value != '' ) {
    alert("End date should be greater than start date")
     form.reset();
  };

});



// change the total price on the #show page


let numberOfDays = document.getElementById("number-of-days");
let pricePerDay = document.getElementById("price-per-day");
let totalPrice = document.getElementById("total-price");


// update the total price in real time

form.addEventListener("change", (event) => {
  let difference = Date.parse(endDate.value) - Date.parse(startDate.value);
  let differenceInDays = (difference / (60*60*24*1000));

  if (startDate.value === '' || endDate.value === '') {
    numberOfDays.innerHTML = 0
     } else {
    numberOfDays.innerHTML = differenceInDays
  };

// you transform the text in integer after choping the € sign!

  let priceInInteger = pricePerDay.innerText;
  // here you chop the euro sign!
  priceInInteger = priceInInteger.substring(0, priceInInteger.length - 1);
  // here you parse
  priceInInteger = parseInt(priceInInteger);
  // then you can use to update the total price

  if (startDate.value === '' || endDate.value === '') {
    totalPrice.innerHTML = "0 €";
  } else {
    totalPrice.innerHTML = `${priceInInteger * differenceInDays}€`;
  }







});





