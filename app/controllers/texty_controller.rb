class TextsController <ApplicationController
	def index

    puts params["Body"]
    puts params["From"]
    
    message_body = params["Body"]
    from_number = params["From"]
    # Student text Messaging
    @user = User.find_by({phone: from_number})
	    message_array = message_body.split(" ")
	    message_array.each do |m|
	    	if m.start_with?("sick")
	    		a = @user.attendence.status = "excused"
	    		a.save
	    	elsif m.start_with?("late")
	    		 a = @user.attendence.status = "late"
	    		 a.save
	    	end
	    end

    redirect_to "/"
	end

    # Instructor text messaging
	def create
		account_sid = ENV['TWILIO_ACCT_SID']
		auth_token = ENV['TWILIO_AUTH_TOKEN']
		client = Twilio::REST::Client.new account_sid, auth_token

		from = "+12018981678"

	  client.account.sms.messages.create(
	    :from => "#{from}",
	    :to => params[:phone_num],
	    :body => params[:body]
	  )
	  redirect_to "/courses"
	end

end