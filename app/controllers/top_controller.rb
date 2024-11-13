class TopController < ApplicationController
  def main
    if session[:login_uid]  
        redirect_to top_main_path
    end
  end
  
  def login
    user = User.find_by(user_id: params[:user_id])
    if user and BCrypt::Password.new(user.user_pass) == params[:user_pass]
        session[:login_uid] = params[:user_id]
        redirect_to top_main_path
    else
      
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
