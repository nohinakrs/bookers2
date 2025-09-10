class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def index
    @books = Book.all
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def update
    @user = User.find(params[:id])
    
      if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
      else
        render "edit"
      end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end
  end

end
