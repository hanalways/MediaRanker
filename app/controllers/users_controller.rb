class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user 
      head :not_found
    end
  end
  
  def login_form
    @user = User.new
  end

  def login 
    username = params[:user][:username]
    user = User.find_by(username: username)

    if user 
      session[:user_id] = user.id
      flash[:status] = :success
      flash[:message] = "Successfully logged in as an existing user #{user.username}"
    else 
      user = User.create(username: username)
      session[:user_id] = user.id 
      flash[:status] = :success
      flash[:message] = "Successfully logged in as a new user #{user.username}"
    end
    
    redirect_to root_path
  end

  def logout 
    session[:user_id] = nil

    flash[:status] = :success
    flash[:message] = "Successfully logged out"

    redirect_to root_path
  end

  def current 
    @user = User.find_by(id: session[:user_id])

    unless @user 
      flash[:status] = :error
      flash[:message] = "You must be logged in to see this page"
      redirect_to login_path 
      return
    end
  end
end
