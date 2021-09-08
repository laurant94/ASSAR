class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  before_action :only_login_in
  helper_method :logged_in?, :current_user, :str_time

  private
  def only_login_in
    unless logged_in?
      redirect_to app_login_path
    end
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    return nil if !session || !session[:auth] || !session[:auth]['id']
    return @_user||User.find_by_id( session[:auth]['id'] )
  end


  # Methods de traitement
  def str_time(post_time)
    post_time = post_time.to_time
    time = (Time.new - post_time).to_i
    
    if time < 60
      "A l'instant"
    elsif time >= 60 && time < 3600
      "Il y a #{time/60} min "
    else
      if post_time.day == Time.new.day
        "Aujourd'hui à #{post_time.strftime("%H:%M")}"
      elsif post_time.day == Time.new.day.to_i-1
        "Hier à #{post_time.strftime("%H:%M")}"
      else
        post_time.strftime("%d %b %Y à %H:%M")
      end
    end
  end

end
