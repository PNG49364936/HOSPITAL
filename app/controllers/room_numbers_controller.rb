

class RoomNumbersController < ApplicationController
  
    def fiche
        @room_number = RoomNumber.find(params[:id])
    end
    
    def new
      
        @room_number = RoomNumber.new
      end

    def index
        @room_numbers = RoomNumber.all
    end
      
    def create
      pp "1" * 100
      numero = params[:room_number][:numero] # Vérifiez si le paramètre est correctement extrait
      pp "2" * 100
      @room_number = RoomNumber.new(numero: numero)
      pp "3" * 100
       if @room_number.save
        pp "4" * 100
       redirect_to root_path, notice: "Le numéro de chambre a été créé avec succès."
      #----------------------------------
       elsif
       @room_number.numero.to_s.length > 4
       redirect_to new_room_number_path, alert: "Erreur, 4 chiffres maxi"
     
       else 
        redirect_to new_room_number_path, alert: "Le n° renseigné n'est pas un numero de chambre connu ou est déjà utilisé"
      
      end


    end   

    def destroy
      @room_number = RoomNumber.find(params[:id])
      @chambre = Chambre.find_by(numero: @room_number.numero)
            
      if @chambre && @chambre.disponible == false
        redirect_to root_path, notice: "chambre occupée, impossible d'annuler"
      else
        @room_number.destroy
        @chambre.destroy if @chambre
        redirect_to root_path, notice: "Numero et/ou chambre annulés"     
      end
    end

    
      
      private
      
      def params_room_number 
        params.require(:room_number).permit(:numero)
      end

end
