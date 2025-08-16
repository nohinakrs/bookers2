class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end
end
