class ReviewsController < ApplicationController
  before_action :find_book
  before_action :authenticate_user!, only: %i[new edit]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    params[:review][:comment].to_sym # if params[:review][:comment].nil?
    if @review.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
