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
    parties
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

  def parties
    @parties ||= Party.all.select do |party|
      party.title.include?(search_string) ||
      party.user.full_name.include?(search_string)
    end
  end

  def search_string
    params[:search]
  end
end
