class RoomsController < ApplicationController
  
  protect_from_forgery except: [:upload_photo]
  
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :update]


  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
       redirect_to listing_room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @photos = @room.photos
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
  
  
  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def location
  end

  def update
    
    new_params = room_params
    new_params = room_params.merge(active: true) if is_ready_room
    
    if @room.update(new_params)
    end
    redirect_back(fallback_location: request.referer)
  end
  
  def upload_photo
    @room.photos.attach(params[:file])
    render json: { success: true }
  end
  
  def delete_photo
    @image = ActiveStorage::Attachment.find(params[:photo_id])
    @image.purge
    redirect_to photo_upload_room_path(@room)
  end
  
 
  private
  
  def set_room
    @room = Room.find(params[:id])
  end
  
  def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :price, :active, :description)
  end
  
  def is_authorised
      redirect_to root_path unless current_user.id == @room.user_id
  end
    
  def is_ready_room
      !@room.active && !@room.price.blank? && !@room.listing_name.blank? && !@room.photos.blank? && !@room.address.blank?
  end
  
end
