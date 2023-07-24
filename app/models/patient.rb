

    class Patient < ApplicationRecord
        attr_accessor :date_range
        belongs_to :docteur
        belongs_to :chambre
        belongs_to :specialite
        has_many :hospitalizations, dependent: :destroy
      
      
        validates :nom, length: { minimum: 3 }
        validates :nom, presence: true
        validates :chambre, presence: true
    




        #____SANS CONTROLLER
        #validate :room_availability
        #def room_availability
          #if Patient.where.not(id: id).where(chambre_id: chambre_id).where("? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date", start_date, end_date).exists?
          #  errors.add(:chambre_id, "is already booked for this period")
         # end
        #end
        #______FIN________
      
    end

