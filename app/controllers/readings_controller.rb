class ReadingsController < ApplicationController
    skip_before_action :authorized, only: [:create]
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
        reading = Reading.new(reading_params)
        if reading.save
            render json: reading, status: :accepted
        end
    end

    def index
        readings = Reading.all 
        render json: readings, status: :accepted
    end

    def my_readings
        user_id = params["id"]

        readings = UserReading.all.where("user_id":user_id).filter{|pr| pr.position < Reading.find(pr.reading_id).wordCount}.map{|p| [p.position, Reading.all.where("id":p.reading_id)]}

        # uniqReadings = UserReading.all.where("user_id":user_id).map{|pr| pr.reading_id}.uniq
        # readings = uniqReadings.map{|x| UserReading.all.where("user_id":user_id, "reading_id":x).max_by{|p| p.position}}.map{|p| [p.position, Reading.all.where("id":p.reading_id)]}       
        
        # readings = User.all.find_by(id: user_id).user_readings.map{|ur| ur.reading_id}.map{|id| Reading.all.where(id: id)}
        # data = Reading.all.select{|reading| reading.user_readings.where("user_id":user_id).max_by{|ur| ur.position}}

        render json: readings, status: :accepted
    end


    private

    def reading_params
        params.require(:reading).permit(:category, :level, :author, :title, :completeText, :source, :contributor, :wordCount)
    end
end
