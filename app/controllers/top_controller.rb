class TopController < ApplicationController
  def main
    if session[:login_uid]  
        ##redirect_to
    else
        render "login"
    end
  end
  
  def login
    user = User.find_by(user_id: params[:user_id])
    if user and BCrypt::Password.new(user.pass_digest) == params[:user_pass]
        session[:login_uid] = params[:user_id]
        redirect_to top_main_path
    else
        render "error", status: 422
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
