class FlightsController < ApplicationController
  def index
  	@flights = Flight.search(params)
  	@airports = Airport.all.map { |a| [a.code, a.id]}.sort
  	@dates = Flight.get_dates
  	@passengers = (1..4).map { |p| [p.to_s + " passenger".pluralize(p), p] }
  	respond_to do |format|
  		format.html
  		format.xml { render :xml => @flights }
  		format.json { render :json => @flights }
  	end
  end
end
