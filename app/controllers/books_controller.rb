class BooksController < ApplicationController
  before_action :find_book, only: %i[show update edit destroy]
  def index
    if params[:category].blank?
      @books = Book.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(category_id: @category_id)
    end
  end

  def new
    @book = current_user.books.build # Book.new
    # @catigories = Category.all.map { |e| [e.name, e.id] }
  end

  def show
    # @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :desc, :book_cover, :category_id)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
