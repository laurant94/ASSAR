class App::CollectsController < ApplicationController
  before_action :set_collect, only: %i[ show edit update destroy ]

  def index
    @collects = current_user.managed_child.posts.mark_collect
  end

  def show
  end

  def new
    @collect = App::Collect.new
  end

  def edit
  end

  def create
    @collect = App::Collect.new(collect_params )
    @collect.author = current_user
    @collect.child = current_user.managed_child

    respond_to do |format|
      if @collect.save
        format.html { redirect_to @collect, notice: "collect was successfully created." }
        format.json { render :show, status: :created, location: @collect }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collect.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @collect.update(collect_params)
        format.html { redirect_to @collect, notice: "collect was successfully updated." }
        format.json { render :show, status: :ok, location: @collect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collect.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @collect.destroy
    respond_to do |format|
      format.html { redirect_to collects_url, notice: "collect was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collect
      @collect = App::Collect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collect_params
      params.require(:app_collect).permit(:title, :content, :marked_to )
    end
end
