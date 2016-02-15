class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  
  def show
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

    # set a variable to keep track of weather or not the logged in user can view this student
    # we will set this to true if certain conditions are met so we don't have to repeate the same
    # code in multiple places i.e. users is a student and :id is the users id etc...
    can_view = false;

    # if you are a student and this is your id you CAN VIEW this
    # .to_i is neccesary because current_user id is an int and params are all strings be default
    if @current_user['type'] == 'Student' && @current_user['id'] == params[:id].to_i
      # so make it true
      can_view = true
    end

    if @current_user['type'] == 'Instructor'

      # get all courses ids that the instructor is associated with
      instructor_course_ids = CourseUser.select('course_id').where( user_id: session[:current_user]['id'] )

      # next we get all the students that are IN the instructors courses using the instrctors_courses_ids variable above
      # .pluck gets JUST an array not a normal object of models so we can use .in? and .includes?
      # http://stackoverflow.com/questions/17103003/rails-active-record-get-ids-array-from-relation
      @instructor_students_ids = CourseUser.select('user_id').where( :course_id => instructor_course_ids ).pluck(:user_id)

      # if the student we are trying to view is in the instructors classes and not the instructor themselves
      # to_i because params are strings
      # .in? looks for the variable in an array - which is why we used th e.pluck() ^ 
      # http://stackoverflow.com/questions/1986386/check-if-a-value-exists-in-an-array-in-ruby
      if params[:id].to_i.in?( @instructor_students_ids ) && params[:id].to_i != @current_user['id']
        # this is a student of the logged in instructor so they CAN VIEW
        # make it true
        can_view = true
      else
        # if its not there student take them to the course page
        # "and retun" is need because there is more than one redirect in this 'show' action
        # as per the rails error i got when it wasn't there
        redirect_to "/courses" and return
      end
    end  

    # if your a producer
    if @current_user['type'] == 'Producer'
      # make sure the id we are trying to view is a student's
      # this @student is defined by set_student at the bottom of this file
      if @student['type'] == 'Student' 
        # this is a student and the logged in user is a producer and they CAN VIEW all of them
        can_view = true
      else
        # otherwise go back to the course list
        redirect_to '/courses' and return
      end
    end

    # if you can view then view it
    if can_view
      #first get the id of the student's course
      student_course_id = CourseUser.where(user_id: params[:id]).first
      #next get the course info by using the id
      @course = Course.find(student_course_id)
      # get all the attendances that are late (1) or unexcused (3)
      # for the student we are trying to view
      # because those are the only ones we count for danger
      @student_attendance = Attendance.where(user_id: params[:id], status: [3,1])
      # get the count of lates
      @lateness_count= Attendance.where(user_id: params[:id], status: [1]).count
      # get the count of unexcuseds
      @unexcused_count = Attendance.where(user_id: params[:id], status: [3]).count
      # add em up, 3 lates = 1 unexcused
      # we divide because a late is 1/3 of an unexecused absence 
      @danger_count = (@lateness_count / 3) + @unexcused_count

    else
      # otherwise redirect to home
      # this should only happen for students
      redirect_to "/"
    end

  end

  def update
    @updateattend = Student.find(params[:id])
    @Student.update(student_params)
    redirect_to "/instructor"
  end

  # GET /students/new
  # def new
  #   @student = Student.new
  # end

  # # GET /students/1/edit
  # def edit
  # end

  # POST /students
  # POST /students.json
  # def create
  #   @student = Student.new(student_params)

  #   respond_to do |format|
  #     if @student.save
  #       format.html { redirect_to @student, notice: 'Student was successfully created.' }
  #       format.json { render :show, status: :created, location: @student }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @student.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  # def update
  #   respond_to do |format|
  #     if @student.update(student_params)
  #       format.html { redirect_to @student, notice: 'Student was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @student }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @student.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /students/1
  # DELETE /students/1.json
  # def destroy
  #   @student.destroy
  #   respond_to do |format|
  #     format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
        @student = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email, :password_digest, :image, :phone, :type)
    end
end