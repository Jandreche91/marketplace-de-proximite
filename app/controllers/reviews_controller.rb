class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @courgette = Courgette.find(params[:courgette_id])
    @review = Review.new(review_params)
    @review.courgette = @courgette
    @review.author = current_user.id
    if @review.save
      redirect_to bookings_path
      flash[:notice] = "Thank you for your review! ✔✔✔ It has now been published! 📪"
    else
      render :new

    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
