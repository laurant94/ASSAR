class App::ConnectedsController < ApplicationController
  before_action :set_connected, only: %i[ show edit update destroy ]

  # GET /connecteds or /connecteds.json
  def index
    @connecteds = current_user.managed_child.church.targets
    @childs = current_user.managed_child.church.childs
    .without(current_user.managed_child)
  end

  # GET /connecteds/1 or /connecteds/1.json
  def show
  end

  # GET /connecteds/new
  def new
  end

  # GET /connecteds/1/edit
  def edit
  end

  # POST /connecteds or /connecteds.json
  def create
    # @current_child = current_user.managed_child
    # @child = Child.find(connected_params[:auth_id])
    # @child = @current_child.targets.where(auth_id: @child.id).first
    # unless @child.present?
    #   @current_child.targets << App::Connected.new(connected_params)
    #   redirect_to app_connecteds_path, notice: "Connexion was successfully created." 
    # else
    #   redirect_to app_connecteds_path, notice: "Connexion already exist." 
    # end
  end

  # PATCH/PUT /connecteds/1 or /connecteds/1.json
  def update
    # @connected.update_columns(approved: !@connected.approved)
    # redirect_to app_connecteds_path, notice: "Connection success updated"
  end

  # DELETE /connecteds/1 or /connecteds/1.json
  def destroy
    # @connected.destroy
    # redirect_to app_connecteds_path, notice: "Connection success deteled"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connected
      @connected = App::Connected.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def connected_params
      params.require(:app_connected).permit(:auth_id)
    end
end
