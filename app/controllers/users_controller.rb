class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = Book.all
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
end
