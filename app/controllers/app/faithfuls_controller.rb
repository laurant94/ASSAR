class App::FaithfulsController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy, :approve, :eject ]
  def index
    @faithfuls = current_user.managed_child.faithfuls
  end

  def new
    @faithful = App::Faithful.new
  end

  def create
    @faithful = App::Faithful.new(user_params)
    @child = current_user.managed_child
    
    if @faithful.save(validate: false)
      @child.faithfuls << @faithful
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
    params = user_params
    if @faithful.update_columns( 
      firstname: params["firstname"], 
      lastname: params["lastname"],
      email: params["email"],
      phone: params["phone"],
      profession: params["profession"],
    )
      redirect_to app_faithful_path(@faithful.id), notice: "faithful updated"
    else
      render :edit
    end
  end

  def approve
    @faithful.update_columns(approved: true)
    redirect_to app_faithfuls_path, notice: "Fidele approuvé avec succes"
  end

  def eject
    
    @faithful.childs.last.faithfuls.delete(@faithful)
    @faithful.update_columns(approved: false)
    redirect_to app_faithfuls_path, notice: "Fidele ejecté avec succes"
  end

  def destroy
    @faithful.destroy
    redirect_to app_faithfuls_path, notice: "faithful deleted"
  end

  private
  def set_user
    @faithful = App::Faithful.childs.find(params[:id])
  end

  def user_params
    params.require(:app_faithful).permit(:phone, :email, :firstname, :lastname,
    :profession, :child_id)
  end
end
