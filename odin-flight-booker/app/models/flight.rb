class Flight < ActiveRecord::Base
	belongs_to :from_airport, class_name: "Airport"
	belongs_to :to_airport, class_name: "Airport"

	has_many :bookings
	has_many :passengers, through: :bookings


	def self.search(params)
		if !params[:from_airport_id].blank?
			departing_airport = params[:from_airport_id]
			arriving_airport = params[:to_airport_id]
			date = params[:date].to_date
			where(from_airport_id: departing_airport,
						to_airport_id: arriving_airport,
						date: date.beginning_of_day..date.end_of_day 
						).includes(:from_airport, :to_airport)
		end
	end

	def self.get_dates
		pluck(:date).map { |d| [ d.strftime("%m/%d/%Y"), d.to_date] }.uniq
	end
end
