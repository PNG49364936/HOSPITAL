require 'specialite'
class DocteursController < ApplicationController
    def index
     @docteurs = Docteur.all
     @specialites = Specialite.all
    end

    def show
      @docteur = Docteur.find(params[:id])
    end

    def new
      @docteur = Docteur.new
      #@selected_specialites = session[:selected_specialites]
      @specialites = Specialite.all
      @docteur.absences.build
    end

    def create
      @docteur = Docteur.new(docteur_params)
      # Récupère les dates de début et de fin d'absence depuis le formulaire
  
      debut_absence = params[:docteur][:debut_absence]
      fin_absence = params[:docteur][:fin_absence]
      # Associe les dates d'absence au médecin
      @docteur.debut_absence = debut_absence
      @docteur.fin_absence = fin_absence
      if @docteur.save
        # Redirige l'utilisateur vers la page du docteur créé
        redirect_to docteur_path(@docteur), notice: "Fiche docteur créée"
      else
        # Si la validation des données échoue, affiche un message d'erreur
        redirect_to new_docteur_path, alert: "Erreur lors de la création de la fiche docteur"
      end
    end
  
    def edit
      @docteur = Docteur.find(params[:id])
      @docteurs = Docteur.all
      @specialites = Specialite.all
      @debut_absence = @docteur.debut_absence
      @fin_absence = @docteur.fin_absence
      @absences = @docteur.absences
      @docteurs = Docteur.includes(:absences).all
   
    end

    def update
      @docteur = Docteur.find(params[:id])
      @docteur.update(docteur_params)
      redirect_to root_path, notice: "Fiche docteur modifiée"
    end

    def destroy
      @docteur = Docteur.find(params[:id])
      if @docteur.patients.any?
         redirect_to root_path, notice: "Patient present"
      else
        @docteur.destroy
        redirect_to root_path, notice: "Annulation enregistrée"
      end
      
    end

    def fiche
      @docteur = Docteur.find(params[:id])
    end

    

    def choose_specialites
      specialites = params[:specialites]
      specialites.each do |specialite|
      Specialite.create(name: specialite)
      end
      redirect_to root_path,notice: 'Specialités créées'
    end

    private
    def docteur_params
      params.require(:docteur).permit(:nom, :specialite, :specialite_id, :debut_absence, :fin_absence, absences_attributes: [:id, :debut_absence, :fin_absence, :_destroy])
    end



end
