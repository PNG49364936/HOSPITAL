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
    this.destroyFlatpickr(this.startTarget);
    this.destroyFlatpickr(this.endTarget);
    
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
    // Votre code existant ici...
  }

  addNewAbsenceInput(absence, nom, specialiteId) {
    // Votre code existant ici...
  }

  clearDateInputs() {
    this.startTarget.value = "";
    this.endTarget.value = "";
  }

  addAbsenceFields() {
    const tableBody = document.querySelector("tbody");
    const newRow = document.createElement("tr");

    // Column for debut_absence
    const debutColumn = document.createElement("td");
    const debutInput = document.createElement("input");
    debutInput.type = "text";
    debutInput.name = "docteur[absences_attributes][][debut_absence]";
    debutInput.setAttribute("data-absence-selector-target", "start");
    debutInput.classList.add("rounded-box");
    debutColumn.appendChild(debutInput);
    
    // Column for fin_absence
    const finColumn = document.createElement("td");
    const finInput = document.createElement("input");
    finInput.type = "text";
    finInput.name = "docteur[absences_attributes][][fin_absence]";
    finInput.setAttribute("data-absence-selector-target", "end");
    finInput.classList.add("rounded-box");
    finColumn.appendChild(finInput);

    // Ajout des boutons "Valider dates" et "Supprimer"
    const submitBtn = document.createElement("input");
    submitBtn.type = "submit";
    submitBtn.value = "Valider dates";
    submitBtn.classList.add("btn", "btn-primary");

    const deleteLink = document.createElement("a");
    deleteLink.href = "#"; // Vous devez définir la bonne URL ici
    deleteLink.innerText = "Supprimer";
    deleteLink.classList.add("btn", "btn-primary");
    deleteLink.setAttribute("data-confirm", "Êtes-vous sûr de vouloir supprimer cette absence?");
    deleteLink.setAttribute("data-method", "delete");

    const btnDiv = document.createElement("div");
    btnDiv.classList.add("btn");
    btnDiv.appendChild(submitBtn);
    btnDiv.appendChild(deleteLink);

    const actionColumn = document.createElement("td");
    actionColumn.appendChild(btnDiv);

    newRow.appendChild(debutColumn);
    newRow.appendChild(finColumn);
    newRow.appendChild(actionColumn);
  
    tableBody.appendChild(newRow);

    // Réinitialisez Flatpickr pour les nouveaux champs
    this.initializeFlatpickrForNewRow(newRow);
  }

  initializeFlatpickrForNewRow(row) {
    const startInput = row.querySelector('[data-absence-selector-target="start"]');
    const endInput = row.querySelector('[data-absence-selector-target="end"]');
  
    this.destroyFlatpickr(startInput);
    this.destroyFlatpickr(endInput);
  
    flatpickr(startInput, {
      minDate: "today",
      onChange: this.updateEndPicker.bind(this)
    });

    flatpickr(endInput, {
      minDate: "today",
      onChange: this.updateAbsenceFields.bind(this)
    });
  }

  destroyFlatpickr(element) {
    const fp = element._flatpickr;
    if (fp) {
      fp.destroy();
    }
  }
}


