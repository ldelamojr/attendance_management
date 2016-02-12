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
    @student = Student.find(params[:id])
	
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
  def index
    puts params["Body"]
    puts params["From"]
    
    body = params["Body"]
    from = params["From"]

    # SMSLogger.log_text_message from_number, message_body
    @user = User.find_by({phone: from_number})
      arr = body.split(" ")
      arr.each do |m|
        if m.start_with?("sick")
          a = @user.user_id
          a.attendence = "excused"
          a.save
        elsif m.start_with?("late")
           a = @user.user_id
           a.attendence = "late"
           a.save
        end
      end

    redirect_to "/"
  end

  def new
    @user = User.find(params[:student_id])
    @absences = Course.find(params[:course_id]).max_absences-1
  end

  def create
    account_sid = ENV['TWILIO_ACCT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+1208981678"

    client.account.sms.messages.create(
      :from => "#{from}",
      :to => params[:phone_num],
      :body => params[:body]
    )
    redirect_to "/courses"
  end

end
  # ************************
  # ************************

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email, :password_digest, :image, :phone, :type)
    end
end