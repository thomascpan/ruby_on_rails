# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.delete_all
Flight.delete_all

airports = [["SFO", "San Francisco"], ["LAX", "Los Angeles"], ["JFK", "New York"], ["ATL", "Atlanta"]]

airports.each do |airport|
	Airport.create(code: airport.first, city: airport.last)
end

dur = { "LAX/SFO" => 1, "SFO/LAX" => 1,
				"LAX/JFK" => 5, "JFK/LAX" => 5,
				"LAX/ATL" => 6, "ATL/LAX" => 6,
				"SFO/JFK" => 5, "JFK/SFO" => 5,
				"SFO/ATL" => 4, "ATL/SFO" => 4,
				"JFK/ATL" => 2, "ATL/JFK" => 2 }

airports1 = Airport.all.map { |a| [a.id, a.code] }
airports2 = Airport.all.map { |a| [a.id, a.code] }

date = Date.today

airports1.each do |airport1|
	airports2.each do |airport2|
		if airport1.first != airport2.first
			Flight.create(from_airport_id: airport1.first, to_airport_id: airport2.first, date: date + 3.hours, duration: dur[ "#{airport1.last}/#{airport2.last}" ] )
			Flight.create(from_airport_id: airport1.first, to_airport_id: airport2.first, date: date + 6.hours, duration: dur[ "#{airport1.last}/#{airport2.last}" ] )
			Flight.create(from_airport_id: airport1.first, to_airport_id: airport2.first, date: date + 1.day, duration: dur[ "#{airport1.last}/#{airport2.last}" ] )
			Flight.create(from_airport_id: airport1.first, to_airport_id: airport2.first, date: date + 1.day + 6.hours, duration: dur[ "#{airport1.last}/#{airport2.last}" ] )
			Flight.create(from_airport_id: airport1.first, to_airport_id: airport2.first, date: date + 2.days, duration: dur[ "#{airport1.last}/#{airport2.last}"] )
			Flight.create(from_airport_id: airport1.first, to_airport_id: airport2.first, date: date + 2.days + 6.hours, duration: dur[ "#{airport1.last}/#{airport2.last}" ] )
		end
	end
end