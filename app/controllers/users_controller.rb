class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.new
    user.name = params[:name]
    user.gender = params[:gender]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save
      session[:user_id] = user.id
      redirect_to '/events'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id 
      redirect_to "/events"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.name = params[:name]
    user.gender = params[:gender]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]

    if user.save
      redirect_to '/events'
    else 
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/events'
  end

end
