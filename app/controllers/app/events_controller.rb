class App::EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = current_user.managed_child.posts.mark_event
  end

  def show
  end

  def new
    @event = App::Event.new
  end

  def edit
  end

  def create
    @event = App::Event.new(event_params )
    @event.author = current_user
    @event.child = current_user.managed_child

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = App::Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:app_event)
      .permit(:title, :content, :marked_to, :unmarked_to )
    end
end
