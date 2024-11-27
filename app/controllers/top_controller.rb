class TopController < ApplicationController
  def main 
      if session[:login_uid]
           redirect_to home_index_path
      else
          render "login_form"
      end
  end
  
  def login_form
    user = User.find_by(user_id: params[:user_id])
    logger.debug('out_if')
    if user.user_pass == params[:user_pass]
      logger.debug('if')
      session[:login_uid] = params[:user_id]
      redirect_to home_index_path
    else
      render "main", status: 422
    end
  end
  
  def logout
    logger.debug('logout1')
    session.delete(:login_uid)
    redirect_to root_path
    logger.debug('logout2')
  end
  
  def current_user
    if session[:user_id]
     #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
