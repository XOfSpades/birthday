class GuestController < ApplicationController
  def create
    Guest.create(party: party, user: user)
    render "party/show"
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def party
    @party ||= Party.find(params[:party_id])
  end
end
