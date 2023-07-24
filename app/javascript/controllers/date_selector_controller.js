import { Controller } from "stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["start", "start_date", "end_date", "chambre"];

  connect() {
    console.log("hello1");
    console.log(document.readyState);

    setTimeout(() => {
      this.startFlatpickr = flatpickr(this.startTarget, {
        mode: "range",
        disable: [],
        minDate: "today",
        onClose: (selectedDates, dateStr, instance) => {
          console.log("hello3");
          let [startDate, endDate] = selectedDates;
          console.log("hello4");
          if (startDate && endDate) {
            console.log("Start Date: ", this.formatDate(startDate));  // log formatted start date
            console.log("End Date: ", this.formatDate(endDate));    // log formatted end date
            this.start_dateTarget.value = this.formatDate(startDate);
            this.end_dateTarget.value = this.formatDate(endDate);
            console.log("end");
          }
        },
      });
      console.log("hello chambre");
      console.log(this.chambreTarget);

      this.chambreTarget.addEventListener('change', this.updateDates.bind(this));
      this.chambreTarget.dispatchEvent(new Event('change'));  // Trigger the 'change' event manually
      console.log(this.chambreTarget);
      console.log("toto");
    }, 0);
  }

  updateDates() {
    const chambreId = this.chambreTarget.value;
    fetch(`/chambres/${chambreId}/unavailable_dates`)
      .then(response => response.json())
      .then(this.setUnavailableDates.bind(this));
  }

  
  setUnavailableDates(dates) {
    const parsedDates = dates.map(date => new Date(date));
    this.startFlatpickr.set('disable', parsedDates);
  }

  formatDate(date) {
    let month = '' + (date.getMonth() + 1);
    let day = '' + date.getDate();
    let year = date.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
  }
}
