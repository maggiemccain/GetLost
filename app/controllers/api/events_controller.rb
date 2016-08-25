module Api
  class EventsController < ApplicationController

    def list_within

      userLoc = [params[:lat].to_f, params[:lng].to_f]

      if params[:recent] != nil

      else
          events = Event.select("events.*, hobbies.sport, hobbies.image_url as hobby_image_url").joins(:hobby)
      end

      if params[:radius] != nil
        radius = params[:radius].to_f
      else
        radius = 7000;
      end
      render json: events.select {|event| calDistance(userLoc, [event.latitude, event.longitude]) <= radius}
    end


# Geocoder::Calculations.distance_between([34.05,-118.25], [40.72,-74], :units => :km).round
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
