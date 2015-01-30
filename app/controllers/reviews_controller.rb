class ReviewsController < ApplicationController
def index
     @reservation = Reservation.find(params[:reservation_id])
    #2nd you get all the comments of this post
    @reviews = @reservation.reviews
end

def create
	@reservation = Reservation.find(params[:reservation_id])
	@review = @reservation.reviews.create(review_params)
	@review.user=current_user
	@review.save
	redirect_to reservation_reviews_path
end

def new
		reservation = Reservation.find(params[:reservation_id])
    #2nd you build a new one
    @review = reservation.reviews.build
end

def show
	@review = Review.find(params[:id])
end

def edit
	reservation = Reservation.find(params[:reservation_id])
    @review = reservation.reviews.find(params[:id])
end

def update
    @reservation = Reservation.find(params[:reservation_id])
    @review = @reservation.reviews.find(params[:id])
    if @review.user == current_user
    	if @review.update(review_params)
        	redirect_to reservation_reviews_path
      	else
        render 'edit'
      	end
    else 
      redirect_to reservation_reviews_path
      flash[:notice] = "Not ur Review. Can't Edit"
    end 
end 

def destroy
	@reservation=Reservation.find(params[:reservation_id])
     @review = @reservation.reviews.find(params[:id])
     if @review.user==current_user
    	@review.destroy
    	redirect_to reservation_reviews_path
    else
    	redirect_to reservation_reviews_path
      	flash[:notice] = "Not ur Review. Can't Delete"
    end
end	


private

def review_params
	params.require(:review).permit(:reviewer, :review)
end

end
