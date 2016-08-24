module Api
  class EventsController < ApplicationController

    def list_all
      events = Event.joins("inner join hobbies on hobbies.id = hobby_id").select("events.id, events.listing as event_name, latitude, longitude, hobbies.sport as hobby_name")
      render json: events
    end

    def get_address
      address = Geocoder.address([-37.793643275000754,144.43313598632812])
      render json: address
    end

    # -37.793643275000754
    # 144.43313598632812

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
end
