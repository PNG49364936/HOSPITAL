class Specialite < ApplicationRecord
 
  has_many :docteur_specialites, class_name: 'DocteurSpecialite'
  has_many :docteurs, through: :docteur_specialites
  has_many :patients

 
 

  SPECIALITES_AUTORISEES = ['Medecine Generale', 'Cardiologie', 'Dermatologie', 'Opthamologie']

  validates :specialite, inclusion: { in: SPECIALITES_AUTORISEES }
end
