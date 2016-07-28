class ReservationController < ApplicationController
  before_action :authenticate_user!
  before_action :party

  def create
    @reservation = Reservation.create(
      user: current_user, wish_list_item: wish_list_item)
    render "party/show"
  end

  def destroy
    reservation && reservation.delete
    render "party/show"
  end

  private

  def reservation
    @reservation ||= Reservation.where(
      user_id: current_user.id, wish_list_item_id: params[:wish_list_item_id]
    ).first
  end

  def party
    @party ||= Party.find(params[:party_id])
  end

  def wish_list_item
    @wish_list_item ||= WishListItem.find(params[:wish_list_item_id])
  end
end
