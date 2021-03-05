class SessionsController < ApplicationController
  def new
  end


  #Login
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      render "new", notice: "username or password is invalid"

    end
  end

  #DELETE current_user
  #Log out
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end
