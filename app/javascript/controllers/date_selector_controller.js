import { Controller } from "stimulus";
import flatpickr from "flatpickr";


export default class extends Controller {
  static targets = ["start", "end", "chambre"];

  connect() {
    if (this.hasChambreTarget) {
      this.updateDates();
      this.chambreTarget.addEventListener("change", this.updateDates);
    }
  }

  updateDates = () => {
    const chambreId = this.chambreTarget.value;
    fetch(`/chambres/${chambreId}/unavailable_dates`)
      .then((response) => response.json())
      .then((dates) => {
        this.setUnavailableDates(dates);
      });
  };

  setUnavailableDates(dates) {
    this.startFlatpickr.set("disable", dates);
    this.endFlatpickr.set("disable", dates);
  }
}








