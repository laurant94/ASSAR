class Me::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update]
  def index

  end

  def show
    puts @group.messages
  end

  def update
    
  end

  private
  def set_group
    @group = current_user.groups.find(params[:id])
    unless @group.present?
      redirect_to me_root_path
    end
  end
end
