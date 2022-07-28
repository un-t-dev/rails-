class RoomsController < ApplicationController
  
  before_action :authenticate_user!, except: [:show]


  def index
    @rooms = Room.all
    binding.pry
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new(room_params)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
       redirect_to rooms_path(@room)
    else
      render :root_path
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def search
    if params[:address]
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    else
      @rooms = Room.none
    end
  end
  
  def word_search
    
    if params[:word]
      @rooms = Room.where('listing_name LIKE ? OR address LIKE ? OR price LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      @rooms = Room.none
    end
  end
 
  private
  
  def set_room
    @room = Room.find(params[:id])
  end
  
  def room_params
      params.permit(:room_type, :listing_name, :address, :price, :room_image)
  end
  
end
