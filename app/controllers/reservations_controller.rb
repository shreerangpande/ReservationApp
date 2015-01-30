class ReservationsController < ApplicationController
	
  def index
    @reservations = Reservation.all
  end
	
  def show
  	@reservation = Reservation.find(params[:id])
	end
	
  def new
		@reservation=Reservation.new
	end
	
  def edit
    @reservation = Reservation.find(params[:id])
	end
	
  def create
		
    @reservation = Reservation.new(reservation_params)
    @reservation.user=current_user
    if @reservation.save
      redirect_to @reservation
    else
      render 'new'
    end
  end
 
  def update
    @reservation = Reservation.find(params[:id])
   if @reservation.user == current_user
      if @reservation.update(reservation_params)
        redirect_to reservations_path
      else
        render 'edit'
      end
    else 
      redirect_to reservations_path
      flash[:notice] = "Not ur post. Can't Edit"
    end
  end 

  def destroy
     @reservation = Reservation.find(params[:id])
    if @reservation.user==current_user
    	@reservation.destroy
    	redirect_to reservations_path
    else
    	redirect_to reservations_path
      flash[:notice] = "Not ur post. Can't Delete"
    end
  end	

	private 

	def reservation_params
	 params.require(:reservation).permit(:pickup_location,:pickup_time,:dropoff_time)
	end

end
