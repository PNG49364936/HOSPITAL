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

  updateAbsenceFields() {
    // Récupérer le nom du médecin et la spécialité du formulaire
    const nom = document.getElementById("nom-field").value;
    const specialiteId = document.getElementById("specialite-id-field").value;
    
    this.absenceFieldsTargets.forEach((field) => {
      const start = this.startTarget.value;
      const end = this.endTarget.value;
      if (start && end) {
        const absence = `${start} to ${end}`;
        field.value = absence;
        this.addNewAbsenceInput(absence, nom, specialiteId);
        this.clearDateInputs();
      }
    });
  }

  addNewAbsenceInput(absence, nom, specialiteId) {
    const input = document.createElement("input");
    input.type = "text";
    input.name = "docteur[absences][]";
    input.value = absence;
    this.element.appendChild(input);

    // Champs cachés pour le nom et la spécialité
    const nomField = document.createElement("input");
    nomField.type = "hidden";
    nomField.name = "docteur[nom]";
    nomField.value = nom;
    this.element.appendChild(nomField);

    const specialiteIdField = document.createElement("input");
    specialiteIdField.type = "hidden";
    specialiteIdField.name = "docteur[specialite_id]";
    specialiteIdField.value = specialiteId;
    this.element.appendChild(specialiteIdField);
  }

  clearDateInputs() {
    this.startTarget.value = "";
    this.endTarget.value = "";
  }
}

