class App::SettingsController < ApplicationController
  before_action :get_setting, only: [:edit, :update]

  def edit
  end

  def update
    @setting.update(setting_params)
    redirect_to app_settings_path
  end


  private
  def get_setting
    @setting = current_user.childs.present? ? current_user.childs.last.church.setting : Setting.new
  end

  def setting_params
    params.require(:setting).permit(:app_name, :navbar_border, 
    :devise,
    :body_small_text, :navbar_small_text, :sidebar_small_text,
    :footer_small_text, :sidebar_nav_flat_style, :sidebar_nav_legacy_style,
    :sidebar_nav_compact, :sidebar_nav_child_indent, :sidebar_nav_hide_on_collapse,
    :sidebar_disable_auto_expand, :brand_small_text, :navbar_color, 
    :accent_color, :dark_navbar, :sidebar_color, :dark_sidebar, 
    :brand_logo_color )
  end

end
