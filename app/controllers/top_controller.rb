class TopController < ApplicationController
  def main
    if session[:login_uid]  
        redirect_to recipes_path
    end
  end
  
  def login_form
    user = User.find_by(user_id: params[:user_id])
    logger.debug('out_if')
    if user == params[:user_pass]
      logger.debug('if')
      session[:login_uid] = params[:user_id]
      redirect_to recipes_path
    else
      redirect_to root_path
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
