class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @new_event_latLng = {lat: params[:lat], lng: params[:lng]}
  end

  def create
    @event = Event.new
    @event.name = params[:name]
    @event.location = params[:location]
    @event.state = params[:state]
    @event.image_url = params[:image_url]
    @event.attendees = params[:attendees]
    @event.date = params[:date]
    @hobby = Hobby.find_by(name: params[:hobby])
    @event.hobby_id = @hobby.id
    if logged_in?
      @event.creator = current_user.id
    else
      return false
    end
      @event.description = params[:description]
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
    # that call not yet working
    # @user = User.find(@event.creator)
    # <p>Creator : <%=@user.name%></p> will be on show.html.eb
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
    @event.name = params[:name]
    @event.location = params[:location]
    @event.state = params[:state]
    @event.image_url = params[:image_url]
    @event.attendees = params[:attendees]
    @event.date = params[:date]
    @event.description = params[:description]
    if @event.save
      redirect_to '/events'
    else
      render :edit #remain on this page with inputted information
    end
  end


end
