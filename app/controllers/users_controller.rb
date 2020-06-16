class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]
    skip_before_action :verify_authenticity_token, only: [:create, :new_practice] 
   
    def profile
      render json: { user: current_user }, status: :accepted
    end

    def updateuser
      founduser=User.find_by(username: params["user"]["username"])
    end

    def create        
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        # render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        render json: { user: @user, jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end  
   
    private
    def user_params
      params.require(:user).permit(:id, :username, :password, :firstname, :lastname, :agreement, user_reading: [:user_id,:reading_id,:skimWPM,:deepWPM,:position,:comprehensionRating,:paceRating,:created])
    end

end


