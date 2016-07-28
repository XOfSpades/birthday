class WishListItemController < ApplicationController
  before_action :authenticate_user!

  def reserve
    wish_list_item.update(attributes)
    if attributes[:reserved]
      Reservation.create(user: current_user, wish_list_item: wish_list_item)
    else
      reservation = Reservation.find_by(wish_list_item_id: wish_list_item.id)
      reservation.destroy
    end
    flash.notice = "#{wish_list_item.name} erfolgreich reserviert."
    redirect_to(controller: :party, action: :show, id: params[:party_id])
  end

  private

  def wish_list_item
    @wish_list_item ||= WishListItem.find(params[:id])
  end

  def attributes
    return @attributes if @attributes
    parameters = params.require(:wish_list_item).permit(:reserved).to_h

    parameters[:reserved] = ('true' == parameters[:reserved])
    @attributes ||= parameters
  end
end
