class SessionsController < ApplicationController
  def index; end

  def create
    @user = User.find_by(username: login_params[:username])

    if @user&.authenticate(login_params[:password])
      flash[:notice] = 'You signed in successfully!'
      session[:id] = @user.id
      session[:username] = @user.username
      redirect_to articles_path
    else
      flash[:alert] = 'No User found. Please sign up'
      redirect_to new_user_path
    end
    #   login(user)
    #   # Routing Error, No route matches [GET] "/sessions" - occurs bcos of wrong redirectn
    #   redirect_back fallback_location: new_session_path, notice: 'Logged in'
    # else
    #   flash.now[:notice] = 'Invalid username / password combination'
    #   render action: :new
    # end
  end

  def destroy
    reset_session
    redirect_to sessions_path, notice: 'Logged out'
  end

  private

  def login_params
    params.require(:session).permit(:username, :password)
  end
end
