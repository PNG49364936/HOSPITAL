class RoomNumber < ApplicationRecord
      has_many :chambres
      #validate :maximum_number_of_rooms
      validates :numero, length: { maximum: 4, message: "4 caractères maximum" }
      #validate :maximum_number_of_numero
      #private

  #def maximum_number_of_numero
   # if numero.length >=3
   #   errors.add(:base, "Le nombre maximum de chambres a été atteint.")
  # end
# end
      validate :allowed_number
      validate :unique_number

    private
  # allowed_number
  def allowed_number
         allowed_numbers = ['1010', '1011', '1012', '1021', '1022', '1023']
    unless allowed_numbers.include?(numero.to_s)
         errors.add(:numero, "Les seuls chiffres autorisés sont '1010', '1011', '1012', '1021', '1022', '1023'")
    end
  end
  #--------------------------------------------------------------
  #unique_number
  def unique_number
    existing_numbers = RoomNumber.pluck(:numero) # Récupère tous les numéros existants dans la base de données

    if existing_numbers.include?(numero)
      errors.add(:numero, "Ce numéro est déjà utilisé.")
    end
  end

end


