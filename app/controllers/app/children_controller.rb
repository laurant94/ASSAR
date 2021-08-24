class App::ChildrenController < ApplicationController
  before_action :set_app_child, only: %i[ show edit update destroy ]

  # GET /app/children or /app/children.json
  def index
    @app_children = App::Child.all
  end

  # GET /app/children/1 or /app/children/1.json
  def show
  end

  # GET /app/children/new
  def new
    @app_child = App::Child.new
  end

  # GET /app/children/1/edit
  def edit
  end

  # POST /app/children or /app/children.json
  def create
    @app_child = App::Child.new(app_child_params)

    respond_to do |format|
      @church = current_user.managed_church
      @app_child.church = @church
      if @app_child.save
        format.html { redirect_to @app_child, notice: "Child was successfully created." }
        format.json { render :show, status: :created, location: @app_child }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/children/1 or /app/children/1.json
  def update
    respond_to do |format|
      if @app_child.update(app_child_params)
        format.html { redirect_to @app_child, notice: "Child was successfully updated." }
        format.json { render :show, status: :ok, location: @app_child }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/children/1 or /app/children/1.json
  def destroy
    @app_child.destroy
    respond_to do |format|
      format.html { redirect_to app_children_url, notice: "Child was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_child
      @app_child = App::Child.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_child_params
      params.require(:app_child).permit(:name, :acronym, :country, :city, :phone,
        :email, :location, :location_descriptor, :post_code, :president_id, 
        :vice_president_id, :secretary_id, :manager_id, :admin_id)
    end
end
