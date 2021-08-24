class App::FaithfulsController < ApplicationController
  before_action :set_user, only: %i[ show, edit, update, destroy ]
  def index
    @faithfuls = current_user.managed_child.faithfuls
  end

  def new
    @faithful = User.new
  end

  def create
    @faithful = new User(user_params)
    if @faithful.save
      redirect_to app_faithful_path(@faithful.id), notice: "faithful created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @faithful.update_attributes(user_params)
      redirect_to app_faithful_path(@faithful.id), notice: "faithful updated"
    else
      render :edit
    end
  end

  def destroy
    @faithful.destroy
    redirect_to app_faithfuls_path, notice: "faithful deleted"
  end

  private
  def set_user
    @faithful = User.find(params[:id])
  end

  def user_params
    params.require(:faithful).permit(:phone, :email, :firstname, :lastname)
  end
end
