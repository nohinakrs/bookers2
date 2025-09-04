class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = Book.all
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
     flash[:notice] = "Book was successfully created."
     redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end
