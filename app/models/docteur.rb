class Docteur < ApplicationRecord
    validates :nom, length: { minimum: 3 }
        belongs_to :specialite
        has_many :patients
        has_many :absences, dependent: :destroy
        accepts_nested_attributes_for :absences, allow_destroy: true, reject_if: :all_blank
        after_update :check_specialite_change

        private
      
        def check_specialite_change
          if saved_change_to_specialite_id?
            patients.each do |patient|
              # Ici, vous pouvez annuler le patient ou exécuter toute autre action nécessaire.
              patient.destroy
            end
          end
        end    
      
   
end
