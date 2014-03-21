class MessagesController < ApplicationController

	def create
		@person = Person.find(params[:person_id])
		@number = @person.phone

		@message = params[:body]
		 
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'AC138577fdee094b3cb61fd08272e46b17'
		auth_token = '17ff50c7406edcc0a1d7c1d7a101dfc7'
		@client = Twilio::REST::Client.new(ENV["TW_SID"], ENV["TW_TOKEN"])
		 
		message = @client.account.messages.create(:body => "#{@message}",
		    :to => "#{@number}",
		    :from => ENV["TW_SOURCE"])
		puts message.to

		redirect_to root_path
		end

end
