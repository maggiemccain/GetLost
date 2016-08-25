class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @new_event_latLng = {lat: params[:lat], lng: params[:lng]}
    @address = Geocoder.address([params[:lat].to_f,params[:lng].to_f])
  end

  def create
    @event = Event.new
    @event.listing = params[:listing]
    @event.location = params[:location]
    @event.state = params[:state]
    @event.image_url = params[:image_url]
    @event.attendees = params[:attendees]
    @event.date = params[:date]
    @event.latitude = params[:latitude]
    @event.longitude = params[:longitude]
    @event.hobby_id = params[:hobby]
    if logged_in?
      @event.creator = current_user.id
    else
      render :new
    end
    @event.description = params[:description]
    @event.date = params[:date]
    if @event.save
      redirect_to '/events'
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @hobby = Hobby.find_by(id: @event.hobby_id)
    @flagUser = joined? current_user.id, @event.id, Usersevent.all
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy
    # will leave zombie users in join table
    redirect_to '/events'
  end


  def update
    @event = Event.find_by(id: params[:id])
    @event.listing = params[:listing]
    @event.location = params[:location]
    @event.state = params[:state]
    @event.image_url = params[:image_url]
    @event.attendees = params[:attendees]
    # @event.hobby_id = params[:hobby]
    @event.date = params[:date]
    @event.description = params[:description]
    if @event.save
      redirect_to "/events/#{@event.id}"
    else
      render :edit
    end
  end

end
