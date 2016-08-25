module Api

  class UserseventsController < ApplicationController

    def create
      @join = Usersevent.new
      @join.user_id = current_user.id
      @join.event_id = params[:event_id] 
      @join.save
      join_count = Event.find(params[:event_id]).users.count
      attendee_name = User.find(current_user.id).name
      render json: { join_count: join_count, attendee_name: attendee_name}
    end

  end


end
