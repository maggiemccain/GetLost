module Api
  class EventsController < ApplicationController

    def list_within

      userLoc = [params[:lat].to_f, params[:lng].to_f]

      if params[:recent] != nil

      elsif params[:sport] != nil && params[:sport] != "0"
          events = Event.select("events.*, hobbies.sport, hobbies.image_url as hobby_image_url").joins(:hobby).where("hobby_id=#{params[:sport]}")
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

    def list_recent


      last_check = params[:lastCheck].to_i
      current_rows = Event.select("created_at").count()
      if current_rows > last_check
        record_update = Event.select("events.*, hobbies.sport, hobbies.image_url as hobby_image_url").joins(:hobby).order(:created_at).reverse_order.limit(current_rows - last_check)
      end
      render json: {current_count: current_rows, event_update: record_update}
    end


# Geocoder::Calculations.distance_between([34.05,-118.25], [40.72,-74], :units => :km).round
    # -37.793643275000754
    # 144.43313598632812

  end
end
