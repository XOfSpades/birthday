class WishListItemController < ApplicationController
  before_action :authenticate_user!

  def reserve
    item.update(attributes)
  end

  private

  def item
    @wish_list_item ||= WishListItem.find(params[:id])
  end

  def attributes
    params.require(:wish_list_item).permit(:reserved)
  end
end
