class SessionsController < ApplicationController
  #login
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to '/login'
    end
  end

  #logout
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
