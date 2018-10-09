	class EventsController < ApplicationController
	before_action :get_user_list, only: [:index]
	before_action :set_event, only: [:edit, :update]
  def index
  	@events = if params[:user].blank? 
  		Event.includes(:users).where.not('users.id' => nil)
  	else
  		Event.includes(:users).where('users.id' => params[:user])
  	end
  end

  def new
    @event = Event.new()
  end

  def create
  	debugger
  	@event = Event.new(event_params)

  	respond_to do |format|
  	  if @event.save
  	    format.html { redirect_to events_path, notice: 'event was successfully created.' }
  	  else
  	    format.html { render :new }
  	    format.json { render json: @event.errors, status: :unprocessable_entity }
  	  end
  	end

  end

  def edit
  end

  private
  def get_user_list
  	@users = User.all
  end

  def set_event
  	@event = event.find(params[:id])
  end

  def event_params
  	params.require(:event).permit(:title, :description, :starts_at, :ends_at, :collected, :user_ids)
  end
end
