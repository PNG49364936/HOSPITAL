class Docteur < ApplicationRecord
    validates :nom, length: { minimum: 3 }
        pp "testA" * 10
        #has_one :specialite
        belongs_to :specialite
        has_many :patients
      
        
      
   
end
