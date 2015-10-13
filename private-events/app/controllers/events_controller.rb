class EventsController < ApplicationController
	def index
    @events = Event.paginate(page: params[:page])
	end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = current_user.created_events.build
  end

  def create
  	@user = current_user
  	@event = @user.created_events.build(event_params)
  	if @event.save
  		flash[:success] = "Event created"  		
  		redirect_to @event
  	else
  		render 'new'
  	end
  end

  private

  	def event_params
  		params.require(:event).permit(:title, :location, :description, :date)
  	end
end
