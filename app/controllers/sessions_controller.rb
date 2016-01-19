class SessionsController < ApplicationController
  
  def index

  end

  def login
    u = User.find_by_email(params[:email])
   if u && u.authenticate(params[:password])
     session[:current_user_id] = u.id
     redirect_to dash_path
   else
     flash[:loginErrors] = 'Invalid Username or Password'
     render 'index'
   end
  end

  def register
    u = User.create( new_user )
    if u.errors.any?
      flash[:registerErrors] = u.errors.full_messages
      render 'index'
    else
      session[:current_user_id] = u.id
      redirect_to '/dash'
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path, turbolinks: true
  end

  private
  def new_user
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
