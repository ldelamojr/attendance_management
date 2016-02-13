class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  # def index
  #   @courses = Course.all
  # end

  def overview
    
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
end