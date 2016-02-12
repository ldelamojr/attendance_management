class UsersController < ApplicationController
  before_action :set_user, only: [:show, :post, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
class UsersController < ApplicationController
  def index
    render :index
  end

  def login
    user = User.find_by(email: params['name'])
    # checks the db for a user that matches the name submitted.

    if user && user.authenticate(params['password'])
      # if user exists and password is legit then...
      session[:user_name] = user.name 
      @name = session[:user_name]

      if user.type == "Student"
        redirect "Students#show"
      elsif user.type =="Instructor"
        render "Instructors#show"
      else user.type == "Producer"
        render "Producers#show"
      end
        
    else
      @error = true 
      render :index
    end
  end
end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :image, :phone, :type)
    end
end
