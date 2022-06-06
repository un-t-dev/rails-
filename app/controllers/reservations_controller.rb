class ReservationsController < ApplicationController
    before_action :authenticate_user!
    
    def confirm
      @reservation = Reservation.new(reservation_params)
      @days = (@reservation.end_date - @reservation.start_date).to_i
    end
    
    
    def create
      @reservation = Reservation.new(reservation_params)
      @room = Room.find(params[:reservation][:room_id])
      if @reservation.save
        redirect_to reservations_path(@reservation)
      end
    end
    
    
    
    private
      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :person).merge(user_id: current_user.id, room_id: params[:reservation][:room_id])
      end

end
