class UserReadingsController < ApplicationController
    skip_before_action :authorized, only: [:create]
    skip_before_action :verify_authenticity_token, only: [:create]

    def create       
        # params["user_reading"]
          # user_id:,reading_id:,skimWPM:,deepWPM:,position:,comprehensionRating:,paceRating:,created: 
        # params["note"]
          # skim:, comprehension:

        user_id = params["user_reading"]["user_id"]
        reading_id = params["user_reading"]["reading_id"]
        position = params["user_reading"]["position"]
        skimWPM = params["user_reading"]["skimWPM"]
        deepWPM = params["user_reading"]["deepWPM"]
        comprehensionRating = params["user_reading"]["comprehensionRating"]
        paceRating = params["user_reading"]["paceRating"]
        created = DateTime.now

        skim = params["note"]["skim"]
        comprehension = params["note"]["comprehension"]

        practice = UserReading.new(reading_id:reading_id, user_id:user_id, position: position, skimWPM:skimWPM, deepWPM: deepWPM, comprehensionRating:comprehensionRating, paceRating:paceRating, created: created)        
        if practice.save
          Note.create(user_reading_id: practice.id, skim:skim, comprehension: comprehension)  
          render json: { practice: practice }, status: :accepted
        else

          render json: { message: 'Invalid data, could not be updated' }
        end
      end

      def stats 
        user_id = params["id"]
        allStats = UserReading.all.where(user_id:user_id)
        render json: {stats: allStats}, status: :accepted
      end
  

end
