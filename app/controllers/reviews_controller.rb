class ReviewsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id]) 
    if (current_user == @review.user)
      @review.destroy 
    else
      flash[:danger] = "Not authorized!"
    end
    redirect_to product_path(@product)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end
end
