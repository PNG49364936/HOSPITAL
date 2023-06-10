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
  #specialite
  @specialites = Specialite.all
 
  @patient.specialite_id = params[:patient][:specialite_id]
  @patient.specialite = Specialite.find(params[:patient][:specialite_id])

  #puts params[:patient][:doctor_id]
 
  if @docteur.specialite_id != @patient.specialite_id
  
    pp "#{@docteur.specialite.specialite}"
    pp "#{@patient.specialite}"
    pp @patient.errors
    
    flash.now[:alert] = "Mauvais choix du Docteur, svp corriger. Accueil ne peut être accepté"
 
    render :new
   
     elsif @chambre.disponible == false
    render :new, alert: "chambre occupée."
     else
    pp"avant" *100
    @chambre.update(disponible: false)
    pp @chambre.errors
    pp"apres" *100
    @patient.save
    redirect_to patient_path(@patient), notice: "Patient créé avec succès."
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
      params.require(:patient).permit(:nom, :pathologie, :chambre, :commentaires, :docteur_id, :chambre_id, :specialite_id)
   end
   








end
