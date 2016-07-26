class GuestController < ApplicationController
  def create
    Guest.create(party: party, user: user)
    redirect_to(controller: :user, action: :show, id: user.id)
  end

  private

  def user
    User.find(params[:user_id])
  end

  def party
    Party.find(params[:party_id])
  end
end
