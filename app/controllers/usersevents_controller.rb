class UserseventsController < ApplicationController

  def create
    @join = Usersevent.new
    # method for current user to use here?
    current_user = User.find_by(id: session[:id])
    event = Event.find_by(id: params[:event_id])
    @join.user_id = current_user.id
    @join.event_id = params[:event_id]
    # if event.users doesn't include user_id
    # event.users.find {|user| user.id == current_user.id}
      @join.save
      redirect_to '/events'
    # else
      # make button not clickable or show message
    # ajax this process
  end

end
