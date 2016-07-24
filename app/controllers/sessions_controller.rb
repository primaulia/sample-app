class SessionsController < ApplicationController
  def new
  end

  def create
    login_user = User.find_by(email: params[:session][:email].downcase)

    if login_user && login_user.authenticate( params[:session][:password] )
      log_in login_user
      redirect_to login_user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
