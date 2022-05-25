class ReservationsController < ApplicationController
    before_action :authenticate_user!
    
    def new
      @user = current_user.id
      @room = Room.find(params[:room_id])
      @reservation = Reservation.new(params.permit(:room_id, :start_date, :end_date, :person, :total))
      @reservation.user_id = current_user.id
      if @reservation.valid?
       @days = (@reservation.end_date - @reservation.start_date).to_i
       @reservation.total = @days * @reservation.person * @room.price
       binding.pry
      end
    end
    
    
    def create
      @reservation = Reservation.new(params.permit(:room_id, :start_date, :end_date, :person, :total, :user_id))
      @room = Room.find(params[:reservation][:room_id])
      if @reservation.save
      end
    end
    
    
    
    private
      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
      end
end