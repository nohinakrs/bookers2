class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def index
  end
end
