// app/javascript/controllers/date_picker_controller.js

import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["start", "end", "absenceFields"];

  connect() {
    console.log("hello1");
    this.initializeFlatpickr();
    this.updateAbsenceFields();
  }

  initializeFlatpickr() {
    flatpickr(this.startTarget, {
      minDate: "today",
      onChange: this.updateEndPicker.bind(this),
    });

    flatpickr(this.endTarget, {
      minDate: "today",
      onChange: this.updateAbsenceFields.bind(this),
    });
  }

  updateEndPicker(selectedDates, dateStr, instance) {
    const startDate = selectedDates[0];
    flatpickr(this.endTarget, {
      minDate: startDate,
      onChange: this.updateAbsenceFields.bind(this),
    });
  }

  updateAbsenceFields(selectedDates, dateStr, instance) {
    const absences = this.absenceFieldsTargets.map((field) => field.value);
    absences.push(`${this.startTarget.value} to ${this.endTarget.value}`);
    this.absenceFieldsTargets.forEach((field) => (field.value = ""));
    absences.forEach((absence) => {
      const input = document.createElement("input");
      input.type = "hidden";
      input.name = "docteur[absences][]";
      input.value = absence;
      this.element.appendChild(input);
    });
  }
}
