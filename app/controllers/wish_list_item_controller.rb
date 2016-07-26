class WishListItemController < ApplicationController
  before_action :authenticate_user!

  def reserve
    wish_list_item.update(attributes)
    flash.notice = "#{wish_list_item.name} erfolgreich reserviert."
    redirect_to(controller: :party, action: :show, id: params[:party_id])
  end

  private

  def wish_list_item
    @wish_list_item ||= WishListItem.find(params[:id])
  end

  def attributes
    parameters = params.require(:wish_list_item).permit(:reserved).to_h

    parameters[:reserved] = ('true' == parameters[:reserved])
    parameters
  end
end
