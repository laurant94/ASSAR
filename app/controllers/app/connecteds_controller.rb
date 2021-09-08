class App::ConnectedsController < ApplicationController
  before_action :set_connected, only: %i[ show edit update destroy ]

  # GET /connecteds or /connecteds.json
  def index
    @connecteds = current_user.managed_child.connecteds
  end

  # GET /connecteds/1 or /connecteds/1.json
  def show
  end

  # GET /connecteds/new
  def new
    @connected = App::Connected.new
  end

  # GET /connecteds/1/edit
  def edit
  end

  # POST /connecteds or /connecteds.json
  def create
    child = Child.find(connected_params[:child_id])
    @connected = Connected.new( author: current_user, child: child, approved: false )
    @current_child = @current_user.managed_child
    @current_child << child

    respond_to do |format|
      if @current_child.save
        format.html { redirect_to @connected, notice: "Connexion was successfully created." }
        format.json { render :show, status: :created, location: @connected }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @connected.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connecteds/1 or /connecteds/1.json
  def update
    respond_to do |format|
      if @connected.update_columns(approved: true)
        format.html { redirect_to @connected, notice: "Connected was successfully updated." }
        format.json { render :show, status: :ok, location: @connected }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connected.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connecteds/1 or /connecteds/1.json
  def destroy
    @connected.destroy
    respond_to do |format|
      format.html { redirect_to connecteds_url, notice: "Connexion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connected
      @connected = App::Connected.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def connected_params
      params.require(:app_connected).permit(:child_id)
    end
end
