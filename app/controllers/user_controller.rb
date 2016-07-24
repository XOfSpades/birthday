class UserController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.create(attributes)
    render 'show'
  end

  def new
  end

  def update
    user.update(attributes)
    render 'show'
  end

  def destroy
    user.destroy
  end

  def show
    user
  end

  def index
    @users = User.all
  end

  private

  def attributes
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def user
    @user ||= User.find(params[:id])
  end


end
