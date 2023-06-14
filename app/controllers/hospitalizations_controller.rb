class HospitalizationsController < ApplicationController
    def new
        @hospitalization = Hospitalization.new
      end
    
      def create
        @hospitalization = Hospitalization.new(hospitalization_params)
        @hospitalization.save
          
      end
    
      # add more actions as needed...
    
      private
    
      def hospitalization_params
        params.require(:hospitalization).permit(:start_date, :end_date, :patient_id, :chambre_id)
      end
end
