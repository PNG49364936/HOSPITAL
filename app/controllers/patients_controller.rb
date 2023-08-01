class PatientsController < ApplicationController

  def index
      @q = Patient.ransack(params[:q])
      @patients = @q.result.includes(:docteur)
      #@patients = Patient.all
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
    @patient = Patient.new(patient_params)
    @docteur = Docteur.find(params[:patient][:docteur_id].to_i)
    @chambres = Chambre.all
    @chambre = Chambre.find(params[:patient][:chambre_id])
    @specialites = Specialite.all

    @patient.specialite_id = params[:patient][:specialite_id]
    @patient.specialite = Specialite.find(params[:patient][:specialite_id])

    if @docteur.specialite_id != @patient.specialite_id
      flash.now[:alert] = "Mauvais choix du Docteur, svp corriger. Accueil ne peut être accepté"
      render :new and return
    elsif @chambre.disponible == false
      render :new, alert: "chambre occupée." and return
    end


    if @patient.save
      @hospitalization = Hospitalization.new(patient_id: @patient.id, start_date: params[:patient][:start_date], end_date: params[:patient][:end_date], chambre_id: @chambre.id)

      if @hospitalization.valid?
        @hospitalization.save
        redirect_to root_path, notice: "Patient et Hospitalisation créés avec succès."
      else
        @patient.destroy
        flash.now[:alert] = @hospitalization.errors.full_messages.join(", ")
        redirect_to root_path, notice:"Chambre non disponible, essayer d'autres dates" and return
      end
    else
      render :new and return
    end
    
  end





  

  def edit
      
      @patient = Patient.find(params[:id])
      @chambres = Chambre.all
      @specialites = Specialite.all
      @docteurs = Docteur.all
    
      @patient.date_range = formatted_date_range(@patient.start_date, @patient.end_date)
      
      pp @patient.date_range
    end

  def destroy
    @patient = Patient.find(params[:id])
    
    if @patient.chambre.present?
      pp "A"*100
      @patient.chambre.update(disponible: true)
    end
    pp "b"*100
    @patient.destroy
    pp "c"*100
    redirect_to root_path, notice: "Annulation enregistrée"
  end

  def update
    @patient = Patient.find(params[:id])

    if params[:patient][:date_range].present?
      start_date_str, end_date_str = params[:patient][:date_range].split(' to ')
      @patient.start_date = Date.parse(start_date_str)
      @patient.end_date = Date.parse(end_date_str)
    end

    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient mis à jour avec succès.'
    else
      render :edit
    end

  end
  

  # ... (autres actions du contrôleur)









  
  

    def fiche
      @patient = Patient.find(params[:id])
    end


  private


      


      def patient_params
          params.require(:patient).permit(:nom, :pathologie, :chambre, :commentaires, :docteur_id, :chambre_id, :specialite_id, :start_date, :end_date, :date_range)
      end
      
      def formatted_date_range(start_date, end_date)
       "#{l(start_date, format: :short)} - #{l(end_date, format: :short)}"
     end

    







end
