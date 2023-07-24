// fichier Stimulus
import { Controller } from "stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["start", "end", "chambre"];

  connect() {
    this.startFlatpickr = flatpickr(this.startTarget, {
      disable: [],
      onChange: (selectedDates, dateStr, instance) => {
        if (this.endFlatpickr.selectedDates[0] && this.endFlatpickr.selectedDates[0] < selectedDates[0]) {
          this.endFlatpickr.clear();
        }
        this.endFlatpickr.set('minDate', dateStr);
      },
    });
    this.endFlatpickr = flatpickr(this.endTarget, { disable: [] });
    this.chambreTarget.addEventListener('change', this.updateDates.bind(this));
    this.chambreTarget.dispatchEvent(new Event('change'));  // Trigger the 'change' event manually
  }

  updateDates() {
    const chambreId = this.chambreTarget.value;
    fetch(`/chambres/${chambreId}/unavailable_dates`)
      .then(response => response.json())
      .then(this.setUnavailableDates.bind(this));
  }

  setUnavailableDates(dates) {
    this.startFlatpickr.set('disable', dates)
    this.endFlatpickr.set('disable', dates)
  }
}
