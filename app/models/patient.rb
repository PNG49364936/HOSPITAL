

    class Patient < ApplicationRecord
        belongs_to :docteur
        belongs_to :chambre
        belongs_to :specialite
      
        
        validates :nom, length: { minimum: 3 }
      end

