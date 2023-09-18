class AbsencesController < ApplicationController

    def destroy
        @docteur = Docteur.find(params[:docteur_id])
        @absence = @docteur.absences.find(params[:id])
        @absence.destroy
    
        redirect_to edit_docteur_path(@docteur), notice: "Absence supprimée avec succès."
      end

     




end
