class App::GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy add_members eject_member ]

  # GET /groups or /groups.json
  def index
    @groups = current_user.managed_child.groups.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = App::Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = App::Group.new(group_params)
    @child = current_user.managed_child
    respond_to do |format|
      if @child.groups << @group
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        current_user.managed_child.groups << @group
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to app_groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def add_members
    members = params.require(:members).permit(:list)[:list].to_s.split(',')
    errors = []

    members.each do |member|
      m = App::Faithful.find_by(matricule: member.strip, approved: true)
      if(m.present? and m.childs.last == current_user.managed_child)
        @group.faithfuls << m unless @group.faithfuls.include?(m)
      else
        errors << member
      end
    end

    redirect_to app_group_path(@group), notice: "#{members.length - errors.length > 0 ? members.length - errors.length : 0} membre(s) ajoutés sur #{members.length}. 
    #{'Les matricules suivants sont invalides: ' + errors.join(', ') unless errors.empty? }"
  end

  def eject_member
    @group.faithfuls.delete(params[:user_id])
    redirect_to @group, notice: "Utilisateur retiré avec succes de #{@group.name}"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = App::Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:app_group).permit(:name, :acronym, :descriptor, :child_id, :admin_id)
    end
end
