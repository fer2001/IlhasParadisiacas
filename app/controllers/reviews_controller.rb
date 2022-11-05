class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @island = Island.find(params[:island_id])
    @review.island = @island
    @review.user = current_user
    if @review.save
      redirect_to island_path(@island)
    else
      flash[:alert] = "Something went wrong."
      render 'islands/show', status: :unprocessable_entity
    end
    skip_authorization
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to island_path(@review.island)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
