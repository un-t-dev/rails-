class RoosController < ApplicationController
  
  before_action :authenticate_user!


  def index
    @roos = Roo.all
  end

  def new
    @roo = Roo.new(roo_params)
  end

  def create
    @roo = Roo.new(roo_params)
    binding.pry
    if @roo.save
       redirect_to roos_path(@roo)
    else
      render :root_path
    end
  end

  def show
    @roo = Roo.find(params[:id])
    @reservation = Reservation.new
  end
  
  def search
    if params[:room_area]
      @roos = Roo.where('room_area LIKE ?', "%#{params[:room_area]}%")
    else
      @roos = Roo.none
    end
  end
  
  def word_free_search
    if params[:word]
      @roos = Roo.where('room_name LIKE ? OR room_area LIKE ? OR room_price LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      @roos = Roo.none
    end
  end
 
  private
  
  def roo_params
      params.permit(:room_name, :introduction, :room_area, :room_price, :image)
  end
  
end
