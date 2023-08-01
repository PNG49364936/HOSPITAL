class SpecialitesController < ApplicationController
  before_action :hopital_specialities, only: [new]

   def index
    @specialites = Specialite.all
   end

   def show
    @specialite = Specialite.find(params[:id])
   end

   def new
  
      @validated_specialites = Specialite.pluck(:specialite)
      @docteurs_specialites = ['Medecine Generale', 'Cardiologie', 'Dermatologie', 'Opthamologie','Pneumologie']
      @available_specialites = @docteurs_specialites - @validated_specialites
      @available_options = @available_specialites.map { |specialite| [specialite, specialite] }
      @specialite = Specialite.new
   end

   def create
    @specialite = Specialite.new(specialite_params)
    pp "1"*100
    if @specialite.save
      pp "2"*100
      redirect_to new_specialite_path, notice:"Specialité créée"
    else
      pp @specialite.errors
      #render 'new'
      redirect_to new_specialite_path, alert: "specialité pas prévue ou erreur orthographe"
    end
   end

   def edit
   end

   def destroy
      @specialite = Specialite.find(params[:id])
  
       if @specialite.docteurs.empty?
       @specialite.destroy
      redirect_to root_path, notice: "Annulation enregistrée"
    else
      redirect_to root_path, notice: "Impossible d'annuler, la spécialité est associée à un médecin"
    end
   end

   def fiche
    @specialite = Specialite.find(params[:id])
  end

  def hopital_specialites
    @specialites = ['Medecine Generale', 'Cardiologie', 'Dermatologie', 'Opthamologie','pneumologie']
  end

   private
   

  def specialite_params
    params.require(:specialite).permit(:specialite, :docteur_id)
  end


end
















