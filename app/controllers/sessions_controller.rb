class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: login_params[:username])

    if user&.authenticate(login_params[:password])
      login(user)
      # Routing Error, No route matches [GET] "/sessions" - occurs bcos of wrong redirectn
      redirect_back fallback_location: new_session_path, notice: 'Logged in'
    else
      flash.now[:notice] = 'Invalid username / password combination'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_back fallback_location: new_session_path, notice: 'Logged out'
  end

  private

  def login_params
    params.require(:session).permit(:username, :password)
  end
end
