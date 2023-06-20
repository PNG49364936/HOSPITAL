class Hospitalization < ApplicationRecord
  belongs_to :patient
  belongs_to :chambre

  validate :chambre_availability

  private

  def chambre_availability
    pp "25" * 100
    if Hospitalization.where.not(id: id).where(chambre_id: chambre_id).where("? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date", start_date, end_date).exists?
      errors.add(:chambre_id, "est occupée pour cette periode" )
      pp "26" * 100
    end
  end
end
