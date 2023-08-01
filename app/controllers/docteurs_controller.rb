require 'specialite'



class DocteursController < ApplicationController
    def index
     @docteurs = Docteur.all
    end

    def show
      @docteur = Docteur.find(params[:id])
    end

    def new
      @docteur = Docteur.new
      #@selected_specialites = session[:selected_specialites]
      @specialites = Specialite.all
    end

    def create
      # Crée un nouvel objet Docteur à partir des paramètres envoyés par le formulaire
    
      @docteur = Docteur.new(docteur_params)
      pp"t"*50
      # Récupère l'objet Specialite correspondant à l'id envoyé par le formulaire
      @specialite = Specialite.find(params[:docteur][:specialite_id])
      
      pp"u"*50
      # Affecte l'id de la spécialité au docteur
      @docteur.specialite = @specialite
     
      pp"v"*50
      if @docteur.save
        pp"X"*50
         @specialite.save
        pp"w"*50
        # Redirige l'utilisateur vers la page du docteur créé
        redirect_to docteur_path(@docteur), notice: "Fiche docteur créé"
      else
        pp @docteur.errors
        # Si la validation des données échoue, affiche un message d'erreur
        redirect_to new_docteur_path, alert: "4 chiffres maximum"
        # Affiche à nouveau le formulaire d'ajout de docteur avec les erreurs de validation
       
      end
    end
    
    
    
    
    
    

    def edit
      @docteur = Docteur.find(params[:id])
    end

    def update
      @docteur = Docteur.find(params[:id])
      @docteur.update(docteur_params)
      redirect_to root_path, notice: "Fiche docteur modifiée"
    end

    def destroy
      @docteur = Docteur.find(params[:id])
     @docteur.destroy
      redirect_to root_path, notice: "Annulation enregistrée"
      
    end

    def fiche
      @docteur = Docteur.find(params[:id])
    end

    #def choose_specialites
      #@specialites = ['Medecine Generale', 'Cardiologie', 'Dermatologie', 'Opthamologie', 'Gynecologie']
    #end

    def choose_specialites
      specialites = params[:specialites]
      specialites.each do |specialite|
      Specialite.create(name: specialite)
      end
      redirect_to root_path,notice: 'Specialités créées'
    end

    #def create_specialites
     # session[:selected_specialites] = params[:specialites]
      #redirect_to new_docteur_path,notice: 'Specialités créées'
    #end
    
    
    

    private
    def docteur_params
      params.require(:docteur).permit(:nom, :specialite, :specialite_id)
    end



end
