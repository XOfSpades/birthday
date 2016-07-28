require 'rails_helper'

describe WishListItem, type: :model do
  let(:user) do
    User.create(
      password: 'foobarbaz',
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end
  let(:valid_atributes) do
    {
      name: 'Lego Vulkan Truck',
      location: 'Rossmann Rösrath',
      price: 17.99,
      img_url: 'www.lego.com/img_vulkan_truck_61073',
      user: user
    }
  end

  context 'validation' do
    it 'is valid when attributes are valid' do
      expect(WishListItem.new(valid_atributes).valid?).to be true
    end

    it 'requires a name' do
      expect(
        WishListItem.new(valid_atributes.merge(name: nil)).valid?
      ).to be false
    end

    it 'requires a location' do
      expect(
        WishListItem.new(valid_atributes.merge(location: nil)).valid?
      ).to be false
    end

    it 'requires a price' do
      expect(
        WishListItem.new(valid_atributes.merge(price: nil)).valid?
      ).to be false
    end

    it 'requires a img_url' do
      expect(
        WishListItem.new(valid_atributes.merge(img_url: nil)).valid?
      ).to be false
    end

    it 'requires a user' do
      expect(
        WishListItem.new(valid_atributes.merge(user: nil)).valid?
      ).to be false
    end
  end

  describe '#reverved_by' do
    it 'returns the user which reserved the item' do
      wish = WishListItem.create(valid_atributes)
      user = User.create(
        password: 'foobarbaz',
        first_name: 'Hugo',
        last_name: 'Hase',
        email: 'foo@bar.de',
        gravatar: 'www.gravatar.com/hugo_hase'
      )
      reservation = Reservation.create(user: user, wish_list_item: wish)

      expect(wish.reserved_by).to eq user
    end
  end

  describe '#reserved?' do
    it 'returns true when reserved and false when not' do
      wish = WishListItem.create(valid_atributes)
      user = User.create(
        password: 'foobarbaz',
        first_name: 'Hugo',
        last_name: 'Hase',
        email: 'foo@bar.de',
        gravatar: 'www.gravatar.com/hugo_hase'
      )

      expect(wish.reserved?).to be false
      reservation = Reservation.create(user: user, wish_list_item: wish)
      expect(wish.reserved?).to be true
    end
  end
end
