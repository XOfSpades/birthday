require 'rails_helper'

describe Reservation, type: :model do
  let(:user) do
    User.create(
      password: 'foobarbaz',
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end
  let(:other_user) do
    User.create(
      password: 'foobarbaz',
      first_name: 'Kira',
      last_name: 'Katze',
      email: 'kira@katze.de'
    )
  end
  let(:wish_list_item) do
    WishListItem.create(
      name: 'Lego Vulkan Truck',
      location: 'Rossmann Rösrath',
      price: 17.99,
      img_url: 'www.lego.com/img_vulkan_truck_61073',
      user: other_user
    )
  end
  let(:valid_attributes) do
    {
      user: user,
      wish_list_item: wish_list_item
    }
  end

  context 'validations' do
    it 'creates a valid item' do
      expect(Reservation.new(valid_attributes)).to be_valid
    end
  end
end
