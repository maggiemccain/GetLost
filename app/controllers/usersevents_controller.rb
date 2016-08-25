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

#
#
#
# class UserseventsController < ApplicationController
#
#   def create
#     @join = Usersevent.new
#     @event = Event.find_by(id: params[:event_id])
#     @join.user_id = current_user.id
#     @join.event_id = @event.id
#     # if event.users doesn't include user_id
#     # event.users.find {|user| user.id == current_user.id}
#     @join.save
#
#     # @table = Usersevent.all
#     #
#     # @table.each do |match|
#     #   if match.user_id == current_user.id && match.event_id == @event.id
#     #      redirect_to '/events'
#     #   else
#     #     @join.save
#     #   end
#     #   render :show
#     # end
#     #
#
#     # if @event.users.excludes?(current_user.id)
#     #   @join.save
#     # else
#     #   render :show
#     # end
#     # redirect_to '/events'
#     # else
#       # make button not clickable or show message
#     # ajax this process
#   end
#
# end
