class RoomRegistrationsController < ApplicationController
  
  before_action :authenticate_user!


  def index
    @room_registrations = RoomRegistration.all
  end

  def new
    @room_registration = RoomRegistration.new
  end

  def create
    @room_registration = RoomRegistration.new(room_registration_params)
    if @room_registration.save
       redirect_to room_registrations_path
    else
      render :root_path
    end
  end

  def show
    @room_registration = RoomRegistration.find(params[:id])
    @reservation = Reservation.new
  end
  
  def search
    if params[:room_area]
      @room_registrations = RoomRegistration.where('room_area LIKE ?', "%#{params[:room_area]}%")
    else
      @room_registrations = RoomRegistration.none
    end
  end
  
  def word_free_search
    if params[:word]
      @room_registrations = RoomRegistration.where('room_name LIKE ? OR room_area LIKE ? OR room_price LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      @room_registrations = RoomRegistration.none
    end
  end
 
  private
  
  def room_registration_params
      params.require(:room_registration).permit(:id, :room_name, :introduction, :room_area, :room_price, :image).merge(user_id: current_user.id)
  end
  
end
