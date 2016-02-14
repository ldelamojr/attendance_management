class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  # def index
  #   @courses = Course.all
  # end

  def index

    # dont let students view this
    @current_user = User.find( session['current_user']['id'] )

    if ( @current_user.type == 'Student')
      redirect_to '/students/' + @current_user['id'].to_s
    end

    @current_user = User.find( session[:current_user]['id'] )
    # get the id's of all the courses this instructor belongs too

    if @current_user.type == 'Producer'
      course_ids = CourseUser.select('course_id')
    else
      course_ids = CourseUser.select('course_id').where( user_id: @current_user.id )
    end
    # use the ids to select the courses
    @courses = Course.where( :id => course_ids )

    # arrays to hold the counts for each courses statuss
    @excused_counts = []
    @unexcused_counts = []
    @late_counts = []
    @danger_student_lists = []

    # loop through each course and save its status counts to arrays
    @courses.each do |course|

      # get the ids of all the students in the course
      student_ids = CourseUser.select('user_id').where( course_id: course.id )
      # use the ids to get the actual students info
      students = Student.where( :id => student_ids )

      # save the counts of each courses total lates/excuseds/unexcuseds
      @excused_counts.push( Attendance.where( :user_id => student_ids, status: 2).count )
      @unexcused_counts.push( Attendance.where( :user_id => student_ids, status: 3).count )
      @late_counts.push( Attendance.where( :user_id => student_ids, status: 1).count )
      danger_student_ids = Attendance.select('user_id').where( :user_id => student_ids, danger: true)
      @danger_student_lists.push( Student.where( :id => danger_student_ids ) )
    end
  end

  def overview

    # dont let students view this
    @current_user = User.find( session['current_user']['id'] )

    if ( @current_user.type == 'Student')
      redirect_to '/students/' + @current_user['id'].to_s
    end
    
    @course = Course.find(params['id'])
    #  get a list of all the users in this course
    course_user_ids = CourseUser.select('user_id').where( course_id: params['id'] )

    # get all the attendance for this course
    @lateStudents = Student.joins(:attendance).select('users.*, attendances.*').where( :id => course_user_ids ).references(:attendance)
    render :overview
  end
  
  # GET /courses/1
  # GET /courses/1.json
  def show
    
    # dont let students view this
    @current_user = User.find( session['current_user']['id'] )

    if ( @current_user.type == 'Student')
      redirect_to '/students/' + @current_user['id'].to_s
    end

    if ( params['date_offset'] ) 
      
      # this is the value in the url like ?date_offset=1
      offset = Integer(params['date_offset'])
      # todays date plus the offset (which can be negative)
      date = Time.now + offset.day

      # buttons are current offset +/- 1
      @nextButtonVal = Integer(params['date_offset']) + 1
      @prevButtonVal = Integer(params['date_offset']) - 1

    else
      
      # just get todays date
      date = Time.now
      # buttons go back and forward 1 day
      @nextButtonVal = "1"
      @prevButtonVal = "-1"

    end

    # convert to text
    @date = date.strftime("%m/%d/%Y") 


    #  get a list of all the users in this course
    course_user_ids = CourseUser.select('user_id').where( course_id: params['id'] )

    # get all the late/excused/unexcused/present students in the course using the id list
    lateStudents = Student.includes(:attendance).where( attendances: { date: date }, :id => course_user_ids ).references(:attendance)

    # if there are any students in the attendance table for this day make a list of just their ids
    if lateStudents.length > 0

      # make an array to hold the ids
      lateStudentIds = []

      # add the ids one at a time
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

  
