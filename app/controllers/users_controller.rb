require 'pry'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :post, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
   render :index
  end

 def login
  # finds user by their email address, then compares password
   user = User.find_by(email: params['email'])
   if user && user.authenticate(params['password'])

    @current_user = session[:current_user] = user
     # @name = user.name
     # cookies[:username] = user.name
     # cookies[:toexpire] = {:value=> 'I EXPIRE IN 15 SECONDS', :expires=>Time.now+15}

     # redirects to different routes based on user type
     if user.type == "Student"
     redirect_to "/students/#{user[:id]}"
     elsif user.type == "Instructor"
      redirect_to "/instructors/#{user[:id]}"
     else user.type == "Producer"
      redirect_to "/producers/#{user[:id]}"
     end
   else
     @error = true
     render :index
   end
 end






  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(email: params['email'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :name, :email, :password_digest, :image, :phone, :type)
    end
  end




