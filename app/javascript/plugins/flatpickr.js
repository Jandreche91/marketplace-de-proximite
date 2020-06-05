import flatpickr from 'flatpickr'
require("flatpickr/dist/themes/material_green.css");

flatpickr(".datepicker", {  altInput: true,
                            enableTime: false,
                            minDate: "today",
});


// validation that the end date must be greater than the start date

const startDate = document.getElementById("booking_start_date");
const endDate =  document.getElementById("booking_start_date");
const form = document.getElementById("new_booking");

form.addEventListener("change",(event) => {
  console.log(startDate.value)
  if ( Date.parse(startDate.value) > Date.parse(endDate.value)) {alert("End date should be greater than Start date")};
});






