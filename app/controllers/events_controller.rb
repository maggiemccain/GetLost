class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new
    @event.name = params[:name]
    @event.location = params[:location]
    @event.state = params[:state]
    @event.image_url = params[:image_url]
    @event.attendees = params[:attendees]
    @hobby = Hobby.find_by(name: params[:hobby])
    @event.hobby_id = @hobby.id
    @event.description = params[:description]
    @event.creator = session[:id]
    @event.date = params[:date]

    if @event.save #not handling errors yet
      redirect_to '/events'
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @hobby = Hobby.find_by(id: @event.hobby_id)
  end

end
