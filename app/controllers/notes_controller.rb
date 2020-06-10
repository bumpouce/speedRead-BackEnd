class NotesController < ApplicationController

    skip_before_action :authorized, only: [:create]
    skip_before_action :verify_authenticity_token, only: [:create]

    def create       

        # user_reading_id = params["note"]["user_reading_id"]
        # skim = params["note"]["skim"]
        # comprehension = params["note"]["comprehension"]

        # notes = Note.new(user_reading_id:user_reading_id, skim:skim, comprehension: comprehension)        

        # if notes.save
        #   render json: { notes: notes }, status: :accepted
        # else

        #   render json: { message: 'Invalid notes data, could not be updated' }
        # end
      end

end
