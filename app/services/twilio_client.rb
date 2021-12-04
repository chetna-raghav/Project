require 'rubygems' 
require 'twilio-ruby' 

class TwilioClient
	def sendSMS(phone,message)
		account_sid = 'AC6336f0c67c238559817337d77367f854' 
		auth_token = 'c8c4becd717c7d6486f6dee5781d716b' 
		client = Twilio::REST::Client.new(account_sid, auth_token) 
		message = client.messages.create(
			from: '+15853160707',
			to: phone,
			body: message
		)
		
	end


end