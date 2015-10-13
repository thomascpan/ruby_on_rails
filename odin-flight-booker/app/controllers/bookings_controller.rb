class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight_id])
  	@booking = @flight.bookings.build

  	params[:passengers].to_i.times { @booking.passengers.build }
  	@booking.passengers.build if params[:passengers].blank?
  end

  def create
  	@booking = Booking.new(booking_params)
  	if @booking.save
      @booking.passengers.each { |p| PassengerMailer.thank_you_email(p).deliver_now! }
  		redirect_to @booking
  	else
  		render 'new'
  	end
  end

  def show
  	@booking = Booking.find(params[:id])
  end

  private

  	def booking_params
  		params.require(:booking).permit(:flight_id, 
  																		:passengers_attributes => [:name, :email])
  	end
end
