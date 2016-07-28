require 'rails_helper'

describe ReservationController, type: :controller do
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

  let(:party) do
    Party.create(
      date: Date.new(2016, 8, 6),
      title: 'The big birthday party',
      user: other_user
    )
  end

  before do
    expect(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST#create' do
    it 'reserves a WishListItem' do
      parameters = {
        user_id: user.id,
        wish_list_item_id: wish_list_item.id,
        party_id: party.id
      }
      expect do
        post :create, params: { reservation: parameters }
      end.to change { Reservation.count }.by(1)
      reservation = Reservation.all.first
      expect(reservation.user_id).to eq user.id
      expect(reservation.wish_list_item_id).to eq wish_list_item.id
      assert_equal party, assigns(:party)

      assert_template 'party/show'
    end
  end

  describe 'DELETE#destroy' do
    it 'deletes a reservation of a WishListItem' do
      reservation = Reservation.create(
        user: user, wish_list_item: wish_list_item)
      parameters = {
        id: reservation.id,
        party_id: party.id,
        wish_list_item_id: wish_list_item.id
      }
      expect do
        delete :destroy, params: { reservation: parameters }
      end.to change { Reservation.count }.by(-1)
      expect(Reservation.all).to be_empty
      assert_equal party, assigns(:party)

      assert_template 'party/show'
    end
  end
end
