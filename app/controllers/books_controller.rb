class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @newbook = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user =  current_user
    @books = @user.books
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
    redirect_to user_path
    end
  end

  def create
    #クリエイト系をnewbookに統一しわすれてbook変数でエラーが起きていた。修正済み
    @newbook = Book.new(book_params)
    @user = current_user
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@newbook.id)
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to '/books'
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
