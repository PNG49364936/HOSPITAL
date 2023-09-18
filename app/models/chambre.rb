class Chambre < ApplicationRecord
    
 has_one :patient
 has_one :room_numbers
 has_many :hospitalizations

   
  def disponible?
    self.disponible # Renvoie la valeur de l'attribut 'disponible' de la chambre
  end
    
        #def self.disponibles
         # where(disponible: true)
       # end

       

   

        
      
end
