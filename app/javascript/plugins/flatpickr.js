import flatpickr from 'flatpickr'
require("flatpickr/dist/themes/material_green.css");

flatpickr(".datepicker", {  altInput: true,
                            enableTime: false,
                            minDate: "today",
});
