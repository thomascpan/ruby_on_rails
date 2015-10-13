class PassengerMailer < ApplicationMailer
	default from: "thomascpan@gmail.com"

	def thank_you_email(passenger)
		@passenger = passenger
		@booking = @passenger.bookings.last
		email_with_name = "#{@passenger.name} <#{@passenger.email}>"
		@url = 'https://intense-reaches-6678.herokuapp.com/'

		mail(to: email_with_name, subject: 'Thank you for booking with Odin-Flight-Booker!')
	end
end
