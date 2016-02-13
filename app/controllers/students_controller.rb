class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  # def index
  #   @students = Student.all
  # end

  # GET /students/1
  # GET /students/1.json
  def show
    # have to get the logged in user since the session doesnt have the type
    @current_user = User.find(session[:current_user]['id'])

    # set a variable to keep track of weather or not the logged in user can view this student
    can_view = false;


    if @current_user['type'] == 'Student' && @current_user['id'] == params[:id].to_i
      puts("its you!")
      can_view = true
    end

    if @current_user['type'] == 'Instructor'

      instructor_course_ids = CourseUser.select('course_id').where( user_id: session[:current_user]['id'] )

      # get all student ids that belong to the instructor
      # .pluck gets JUST an array not a normal object of models so we can use .in? and .includes?
      @instructor_students_ids = CourseUser.select('user_id').where( :course_id => instructor_course_ids ).pluck(:user_id)

      # if the parama id is in the list then show stuff
      if params[:id].to_i.in?(@instructor_students_ids) && params[:id].to_i != @current_user['id']
        can_view = true
      else
        # if its not there user take them to the course page
        # "and retun" is need because there is more than one redirect in this action
        redirect_to "/courses" and return
      end
    end  

    # if your a producer
    if @current_user['type'] == 'Producer'
      # make sure its a student
      # this @student is defined by set_student at the bottom of this file
      if @student['type'] == 'Student' 
        can_view = true
      else
        # otherwise go back to the course list
        redirect_to '/courses' and return
      end
    end

    # if you can view then view it
    if can_view
      @student = Student.find(params[:id])
      @student_attendance = Attendance.where(user_id: params[:id], status: [3,1])
      @lateness_count= Attendance.where(user_id: params[:id], status: [1]).count
      @unexcused_count = Attendance.where(user_id: params[:id], status: [3]).count
      @danger_count = (@lateness_count*3) + @unexcused_count  
    else
      # otherwise redirect to home
      # this should never happen but is here just in case
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