class GuestsController < ApplicationController
  before_action :set_guest, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  after_action :room_status_change, only: %i[ create update ]
  after_action :room_cancel, only: %i[ destroy ]

  # GET /guests or /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1 or /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests or /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: "Guest was successfully created." }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    @temp_status = @guest.status

    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: "Guest was successfully updated." }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1 or /guests/1.json
  def destroy
    @cancel_status = @guest.status

    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def room_status_change
    # no change
    if @guest.status == @temp_status
      return
    end

    # create a new guest
    if @temp_status.nil? && @guest.status == -1
      return
    end

    @temp = Room.find_by(id: @temp_status)

    # cancel reserve
    if @guest.status == -1
      @room = @temp
      @room.assigned = false
      @room.save
      return
    end

    @room = Room.find_by(id: @guest.status)
    # no such room
    if @room.nil?
      @guest.status = @temp_status
      @guest.save
      flash[:notice] = "No Such Room!"
      return
    end
    # has been reserved
    if @room.assigned
      @guest.status = @temp_status
      @guest.save
      flash[:notice] = "This room has been reserved!"
      return
    end
    # reserve successfully
    if !@temp.nil?
      @temp.assigned = false
      @temp.save
    end
    @room.assigned = true
    @room.save
  end

  def room_cancel
    if @cancel_status == -1
      return
    end

    @room = Room.find_by(id: @cancel_status)
    @room.assigned = false
    @room.save
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :email, :phone, :status)
    end
end
