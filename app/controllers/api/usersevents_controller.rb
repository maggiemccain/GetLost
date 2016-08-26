module Api

  class UserseventsController < ApplicationController

    def create
      ue_table = Usersevent.all
      flag = joined? current_user.id, params[:event_id], ue_table
      @event = Event.find_by(id: params[:event_id])

      if !flag && @event.users.count < @event.attendees.to_i
        @join = Usersevent.new
        @join.user_id = current_user.id
        @join.event_id = params[:event_id]
        @join.save
        join_count = Event.find(params[:event_id]).users.count
        attendee_name = User.find(current_user.id).name
        render json: { join_count: join_count, attendee_name: attendee_name}
      else
        render json: {message: flag}
      end
    end

  end


end
