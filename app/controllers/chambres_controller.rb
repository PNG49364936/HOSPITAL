class ChambresController < ApplicationController
 

  def index
    @chambres = Chambre.all
  end

  def show
    @chambre = Chambre.find(params[:id])
  end

  def new
   
    @used_chambres = Chambre.pluck(:numero).map(&:to_s)
   
    #@all_chambres = []
    #@all_chambres = RoomNumber.pluck(:numero)(&:to_s)
    @all_chambres = RoomNumber.all.map(&:numero).map(&:to_s)

    @available_chambres = @all_chambres - @used_chambres
  
    @available_options = @available_chambres.map { |chambre| [chambre, chambre] }
    @chambre = Chambre.new
  end
  
  

  def create
    @chambre = Chambre.new(params_chambre)
    
    
    if @chambre.save
      redirect_to chambre_path(@chambre), notice: "Chambre créée"
    else
     
    render "new"
    end
  end
  
  
  
  
        
 

  def edit
    @chambre = Chambre.find(params[:id])
  end

  def destroy
    @chambre = Chambre.find(params[:id])
    if @chambre.disponible == true
       @chambre.destroy
      redirect_to root_path, notice: "Chambre supprimée"
    else
      redirect_to root_path, alert: "Cette chambre #{@chambre.numero} est occupée, annuler le patient."
    end
  end
 

  def update
    @chambre = Chambre.find(params[:id])
    @chambre.update(params_chambre)
    redirect_to chambre_path(@chambre), notice:"chambre mis à jour"

  end

  def fiche
    @chambre = Chambre.find(params[:id])
  end

  def unavailable_dates
    chambre = Chambre.find(params[:id])
    hospitalizations = chambre.hospitalizations
  
    dates = hospitalizations.map do |h|
      (h.start_date..h.end_date).to_a
    end.flatten.uniq
  
    render json: dates
  end

  private

  def params_chambre
    params.require(:chambre).permit(:numero, :text, :disponible)
  end

end
