class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to '/signup'
    end
  end

  def show
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end