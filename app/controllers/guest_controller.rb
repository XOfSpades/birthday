class GuestController < ApplicationController
  before_action :authenticate_user!

  def create
    Guest.create(party: party, user: current_user)
    render "party/show"
  end

  private

  def party
    @party ||= Party.find(attributes[:party_id])
  end

  def attributes
    @attributes ||= params.require(:guest).permit(:party_id, :user_id)
  end
end
