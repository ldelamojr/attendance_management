require 'pry'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :post, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #  see if they are alreayd logged in
    if session[:current_user]
      puts("logged in already")
      # if so get their info
      @current_user = User.find( session['current_user']['id'] )

      # send stundents to their page
      if @current_user.type == "Student"
        # and return is needed because there is more than one redirect/render on this action
        redirect_to "/students/" + @current_user.id.to_s and return
      else
        # send instructors/producers to courses view
        redirect_to "/courses" and return
      end
    end
    render :index
  end

  def login

    # finds user by their email address, then compares password
    user = User.find_by(email: params['email'])
    # if there is a user with that email see if it's password matches
    if user && user.authenticate(params['password'])
      # Make a current suer variable to use in the template 
      @current_user = user
      # and make a session with the user info to use throughout the app
      session[:current_user] = user
      # redirects to different routes based on user type
      if user.type == "Student"
        redirect_to "/students/#{user[:id]}"
      elsif user.type == "Instructor"
        redirect_to "/courses"
      else user.type == "Producer"
        redirect_to "/courses"
      end
    else
      # show user an error when login fails
      @error = "Incorrect email or passowrd. Please try again."
      render :index
    end
  end

  def logout
    # remove everything from the session
    # .clear is a method to remove everything from a session
    session.clear
    # send user back to login screen
    redirect_to "/"
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




