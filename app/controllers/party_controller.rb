class PartyController < ApplicationController
  before_action :authenticate_user!

  def create
    Party.create(attributes.merge(user: user))
    render 'show'
  end

  def new
  end

  def update
    party.update(attributes)
    render 'show'
  end

  def destroy
    party.destroy
    render 'index'
  end

  def show
    party
  end

  def index
    @parties = Party.where(user_id: user.id)
  end

  private

  def attributes
    params.require(:party).permit(:date, :title)
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def party
    @party ||= Party.find(params[:id])
  end
end
