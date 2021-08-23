class App::SessionsController < ApplicationController
  skip_before_action :only_login_in, only: [:new, :create]

  def create
    user_params = params.require(:user)
    @user = User.where(phone: user_params[:phone] ).or(User.where(email: user_params[:phone])).first
    if @user && @user.authenticate(user_params[:password])
      session[:auth] = @user.to_session
      redirect_to app_root_path
    else
      flash.now[:danger] = "Identifient ou mot de passe incorrecte"
      render 'new'
    end
  end

  def new
  end

  def show
  end

  def destroy
    session.destroy
    redirect_to app_login_path, success: "Deconnecter avec succes"
  end
end
