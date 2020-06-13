class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @courgette = Courgette.find(params[:courgette_id])
    @review = Review.new(review_params)
    @review.courgette = @courgette
    @review.author = current_user.username
    if @review.save
      redirect_to courgette_path(@courgette)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
