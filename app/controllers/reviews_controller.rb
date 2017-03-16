class ReviewsController < ApplicationController

  def create
  end

  def destroy
    @product = Product.find(params[:product_id]) 
    @review = @product.reviews.find(params[:id]) 
    @review.destroy #remove selected comment in database
    redirect_to product_path(@product)
  end
end
