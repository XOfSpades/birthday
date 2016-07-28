require 'rails_helper'

describe WishListItemController, type: :controller do
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
  let(:party) do
    Party.create(
      date: Date.new(2016, 8, 6), title: 'Birthday', user: other_user
    )
  end
  let(:wish_list_item) do
    WishListItem.create(
      name: 'Lego Vulkan Truck',
      location: 'Rossmann Rösrath',
      price: 17.99,
      img_url: 'www.lego.com/img_vulkan_truck_61073',
      reserved: false,
      user: other_user
    )
  end

  before do
    expect(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'PUT#update' do
    xit 'sets the item to reserved' do
      put :reserve,
          params: {
            id: wish_list_item.id,
            party_id: party.id,
            wish_list_item: { reserved: true }
          }
      wish_list_item.reload
      expect(wish_list_item.reserved).to be true
    end
  end
end
