class PatientsController < ApplicationController

 def index
    @patients = Patient.all
    @specialites = Specialite.all
 end

 def show
    @patient = Patient.find(params[:id])
 end

 def new
  @patient = Patient.new
  @chambres = Chambre.where(disponible: true)
  #@chambres = Chambre.disponibles
  @specialites = Specialite.all
end

def create
  @patient = Patient.new(params_patient)
  @docteur = Docteur.find(params[:patient][:docteur_id].to_i)
  @chambres = Chambre.all
  @chambre = Chambre.find(params[:patient][:chambre_id])
  @specialites = Specialite.all
 
  @patient.specialite_id = params[:patient][:specialite_id]
  @patient.specialite = Specialite.find(params[:patient][:specialite_id])
 
  if @docteur.specialite_id != @patient.specialite_id
    flash.now[:alert] = "Mauvais choix du Docteur, svp corriger. Accueil ne peut être accepté"
    render :new
  elsif @chambre.disponible == false
    render :new, alert: "chambre occupée."
  else
    @chambre.update(disponible: false)
    pp "1"*100
    if @patient.save
     pp "2" * 100
     @hospitalization = Hospitalization.create(patient_id: @patient.id, chambre_id: @patient.chambre_id, start_date: params[:patient][:start_date], end_date: params[:patient][:end_date])

      pp "3" * 100
      if @hospitalization.save
      pp "4" * 100
        redirect_to root_path, notice: "Patient et Hospitalisation créés avec succès."
      else
        
        redirect_to root_path, notice: "une erreur est survenue"
      end
    else
      render :new
    end
  end
end

 
 



 

 def edit
    @patient = Patient.find(params[:id])
 end

 def destroy
   @patient = Patient.find(params[:id])
   
   if @patient.chambre.present?
     @patient.chambre.update(disponible: true)
   end
   
   @patient.destroy
 
   redirect_to root_path, notice: "Annulation enregistrée"
 end

 def update
   @patient = Patient.find(params[:id])
   @patient.update(params_patient)
 
   redirect_to root_path, notice: "Fiche patient créée"
 end

 def fiche
   @patient = Patient.find(params[:id])
 end


private
   def params_patient 
      params.require(:patient).permit(:nom, :pathologie, :chambre, :commentaires, :docteur_id, :chambre_id, :specialite_id, :start_date, :end_date)
   end
   








end
