class ReviewsController < ApplicationController
  def create
    @courgette = Courgette.find(params[:courgette_id])
    @review = Review.new(review_params)
    @review.courgette = @courgette
    if @review.save
      redirect_to courgette_path(@courgette)
    else
      render "courgettes/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
