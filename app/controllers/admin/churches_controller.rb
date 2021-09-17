class Admin::ChurchesController < ApplicationController
  before_action :set_admin_church, only: %i[ show edit update destroy ]

  # GET /admin/churches or /admin/churches.json
  def index
    @admin_churches = Admin::Church.all
  end

  # GET /admin/churches/1 or /admin/churches/1.json
  def show
  end

  # GET /admin/churches/new
  def new
    @admin_church = Admin::Church.new
  end

  # GET /admin/churches/1/edit
  def edit
  end

  # POST /admin/churches or /admin/churches.json
  def create
    @admin_church = Admin::Church.new(admin_church_params)
    @admin_church.setting = Setting.new

    respond_to do |format|
      if @admin_church.save
        format.html { redirect_to @admin_church, notice: "Church was successfully created." }
        format.json { render :show, status: :created, location: @admin_church }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/churches/1 or /admin/churches/1.json
  def update
    respond_to do |format|
      if @admin_church.update(admin_church_params)
        format.html { redirect_to @admin_church, notice: "Church was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_church }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/churches/1 or /admin/churches/1.json
  def destroy
    @admin_church.destroy
    respond_to do |format|
      format.html { redirect_to admin_churches_url, notice: "Church was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_church
      @admin_church = Admin::Church.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_church_params
      params.require(:admin_church).permit(:name, :acronym, :category, :phone, :foundation_date, :agrement, :leader_name, :country, :city, :location, :location_descriptor, :email, :post_code, :admin_id)
    end
end
