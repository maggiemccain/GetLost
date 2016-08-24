class UserseventsController < ApplicationController

  def create
    @join = Usersevent.new
    @event = Event.find_by(id: params[:event_id])
    @join.user_id = current_user.id
    @join.event_id = @event.id
    # if event.users doesn't include user_id
    # event.users.find {|user| user.id == current_user.id}
      @join.save
      redirect_to '/events'
    # else
      # make button not clickable or show message
    # ajax this process
  end

end
