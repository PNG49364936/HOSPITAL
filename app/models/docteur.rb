class Docteur < ApplicationRecord
    validates :nom, length: { minimum: 3 }
        pp "testA" * 10
        #has_one :specialite
        belongs_to :specialite
        has_many :patients
        has_many :absences, dependent: :destroy
        accepts_nested_attributes_for :absences, allow_destroy: true, reject_if: :all_blank
      
        
      
   
end
