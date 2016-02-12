class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

 def show
    # get the instructor
    # once we have login working I think this code should be in the 
    # courses#index since it shows courses
    @instructor = Instructor.find(params[:id])
    # get the id's of all the courses this instructor belongs too
    course_ids = CourseUser.select('course_id').where( user_id: params['id'] )
    # use the ids to select the courses
    @courses = Course.where( :id => course_ids )

    # arrays to hold the counts for each courses statuss
    @excused_counts = []
    @unexcused_counts = []
    @late_counts = []

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
    end
 end




private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_params
	params.require(:user).permit(:name, :email, :password_digest, :image, :phone, :type)    
	end


end
