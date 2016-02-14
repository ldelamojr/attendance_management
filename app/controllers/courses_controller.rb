class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index

    # if some one is logged in
    if session[:current_user]
      # set them as current user
      # have to get the logged in user since the session doesnt have the type
      # not sure why session doesnt have the type in it
      # so we use the id from the session to get the user info from the User table
      @current_user = User.find( session[:current_user]['id'] )
    else
      # if no one is logged in send to home/login page
      redirect_to "/" and return
    end

    # check if the type of user is Student
    if ( @current_user.type == 'Student')
      # if so send them to their own page since that is the only view they are allowed to see
      # .to_s becuase the user id is an integer in the database
      redirect_to '/students/' + @current_user['id'].to_s
    end


    # get the id's of all the courses this instructor/producer belongs too
    # if its a producer
    if @current_user.type == 'Producer'
      # get all the courses
      @courses = Course.all
    else
      # if its an instructor 
      # only get the courses they are associated with
      # use the course user table to get a list of id's of the courses that belong to the logged in instructor
      course_ids = CourseUser.select('course_id').where( user_id: @current_user.id )
      # use that list of ids to get the courses
      # "=>" is how we see if that variable is "in" a list/array/object
      @courses = Course.where( :id => course_ids )
    end

    # arrays to hold the counts for each courses status
    # tried to add these values to the courses like "course.excused = "
    # but that doesn't work like it does in javascript
    @excused_counts = []
    @unexcused_counts = []
    @late_counts = []
    @danger_student_lists = []

    # loop through each course and save its status counts to arrays
    @courses.each do |course|

      # get the ids of all the students in the course
      student_ids = CourseUser.select('user_id').where( course_id: course.id )

      # save the counts of each courses total lates/excuseds/unexcuseds
      # get count of excused students
      @excused_counts.push( Attendance.where( :user_id => student_ids, status: 2).count )
      # get count of unexcused students
      @unexcused_counts.push( Attendance.where( :user_id => student_ids, status: 3).count )
      # get count of late students
      @late_counts.push( Attendance.where( :user_id => student_ids, status: 1).count )

      # get all the ids of students that have danger on thier attendance
      danger_student_ids = Attendance.select('user_id').where( :user_id => student_ids, danger: true)
      # save the list of danger students
      @danger_student_lists.push( Student.where( :id => danger_student_ids ) )
    end
  end

  def overview

    # if some one is logged in
    if session[:current_user]
      # set them as current user
      # have to get the logged in user since the session doesnt have the type
      # not sure why session doesnt have the type in it
      # so we use the id from the session to get the user info from the User table
      @current_user = User.find( session[:current_user]['id'] )
    else
      # if no one is logged in send to home/login page
      redirect_to "/" and return
    end

    # dont let students view this
    # check if the type of user is Student
    if ( @current_user.type == 'Student')
      # if so send them to their own page since that is the only view thet are allowed to see
      # .to_s becuase the user id is an integer in the database
      redirect_to '/students/' + @current_user['id'].to_s
    end

    # get the course we are looking at
    @course = Course.find_by(id: params[:id])

    #  get a list of all the users in this course
    course_user_ids = CourseUser.select('user_id').where( course_id: params['id'] )

    # get all the attendance for this course
    # this selects from the students table and joins it with the attendances table
    # we select everything from both so we have .name and .status etc
    @lateStudents = Student.joins(:attendance).select('users.*, attendances.*').where( :id => course_user_ids )
  end
  
  # GET /courses/1
  # GET /courses/1.json
  def show
    
    # dont let students view this
    # get the user object of the current logged in user using the session id
    @current_user = User.find( session['current_user']['id'] )

    # check if the type of user is Student
    if ( @current_user.type == 'Student')
      # if so send them to their own page since that is the only view thet are allowed to see
      # .to_s becuase the user id is an integer in the database
      redirect_to '/students/' + @current_user['id'].to_s
    end

    # see if there is a date offset like: "?date_offset=5"
    if ( params['date_offset'] ) 
      
      # this is the value in the url like ?date_offset=1
      offset = Integer(params['date_offset'])
      # todays date plus the offset (which can be negative)
      # so (today + 1) or ( today + -5 )
      # add the offset nomber of days to today
      date = Time.now + offset.day

      # set buttons values to the offset +/- 1
      @nextButtonVal = Integer(params['date_offset']) + 1
      @prevButtonVal = Integer(params['date_offset']) - 1

    else
      # no date_offset param
      # just get todays date
      date = Time.now

      # buttons go back and forward 1 day
      @nextButtonVal = "1"
      @prevButtonVal = "-1"

    end

    # convert to text
    @date = date.strftime("%m/%d/%Y") #shows date like 02/15/16


    #  get a list of all the users in this course
    course_user_ids = CourseUser.select('user_id').where( course_id: params['id'] )

    # get all the late/excused/unexcused/present students in the course using the id list
    lateStudents = Student.includes(:attendance).where( attendances: { date: date }, :id => course_user_ids ).references(:attendance)

    # if there are any students in the attendance table for this day make a list of just their ids
    if lateStudents.length > 0

      # make an array to hold the ids of the late students
      lateStudentIds = []

      # add the ids one at a time to the array
      lateStudents.each do | lateStudent |
        lateStudentIds.push(lateStudent.id)
      end

      # get all of the other students NOT in the lateStudentIds array
      otherStudents = Student.where(:id => course_user_ids).where("id NOT IN (?)", lateStudentIds)

      # combine the 2 lists, late students at the top
      @students = lateStudents.push(*otherStudents)

    else
      # no late students so just get all the students in that course
      @students = Student.where(:id => course_user_ids )

    end
  end

  def contact
binding.pry
    account_sid = ""
    auth_token = ""
    client = Twilio::REST::Client.new account_sid, auth_token
     
    from = "+14155992671"  # "+17868027784"   #  # Your Twilio number +13473531559
     
    friends = {
    # "+12018981678" => "Ismail jaafar",  #12018981678
    "+17868599939" => params["name"]
    # "+1"+params["phone"].gsub("-","") => params["name"]
    
    }
    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Hey #{value}, it's #{session[:current_user]['name']}! Can you please email me at #{session[:current_user]['email']} to discuss your attendance, dun dun duuuunnnnn?"
      )
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :name, :email, :password_digest, :image, :phone, :type)
    end
end

  
