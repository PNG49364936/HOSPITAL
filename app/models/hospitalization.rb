class Hospitalization < ApplicationRecord
  belongs_to :patient
  belongs_to :chambre

  validate :chambre_availability
  validate :end_date_after_start_date

  private

  def chambre_availability
    pp "25" * 100
    if Hospitalization.where.not(id: id).where(chambre_id: chambre_id).where("? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date", start_date, end_date).exists?
      errors.add(:chambre_id, "est occupée pour cette periode" )
      pp "26" * 100
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    pp "date" * 100
    if end_date < start_date
      pp "erreur" * 500
      errors.add(:end_date, "doit être postérieure à la date de début d'hospitalisation")
    end
  end




end
