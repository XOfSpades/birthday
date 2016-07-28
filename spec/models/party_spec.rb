require 'rails_helper'

describe Party, type: :model do
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

  let(:valid_attributes) do
    {
      date: Date.new(2016, 8, 6),
      title: 'The big birthday party',
      user: user
    }
  end

  context 'validation' do
    it 'accepts valis attributes' do
      expect(Party.new(valid_attributes).valid?).to eq true
    end

    it 'requires a first_name' do
      expect(
        Party.new(valid_attributes.merge(user: nil)).valid?
      ).to eq false
    end

    it 'requires a last_name' do
      expect(
        Party.new(valid_attributes.merge(date: nil)).valid?
      ).to eq false
    end

    it 'requires a title' do
      expect(
        Party.new(valid_attributes.merge(title: nil)).valid?
      ).to eq false
    end
  end

  describe '#wish_list' do
    let(:other_user) do
      User.create(
        password: 'foobarbaz',
        first_name: 'Imgo',
        last_name: 'Igel',
        email: 'ingo@igel.de'
      )
    end
    let(:wish_lists) do
      [
        WishListItem.create(
          name: 'Lego Vulcan Truck',
          location: 'Rossmann Rösrath',
          price: 17.99,
          img_url: 'www.lego.com/img/vulcan_truck_61073',
          user: user
        ),
        WishListItem.create(
          name: 'Lego Vulcan Station',
          location: 'ToysRus',
          price: 89.99,
          img_url: 'www.lego.com/img/vulcan_station_61075',
          user: user
        ),
        WishListItem.create(
          name: 'Lego Creator Red creatures',
          location: 'ToysRus',
          price: 14.99,
          img_url: 'www.lego.com/img/red_creatures_61075',
          user: other_user
        )
      ]
    end

    before { ActiveRecord::Base.transaction { wish_lists.each(&:save!) } }

    it 'returns the right wish list' do
      wish_list = Party.create(valid_attributes).wish_list
      expect(wish_list.size).to eq 2
      expect(wish_list).to include(wish_lists.first)
      expect(wish_list).to include(wish_lists.second)
    end
  end

  describe '#on_guest_list?' do
    it 'returns true when user is on list' do
      party = Party.create(valid_attributes)
      Guest.create(party: party, user: other_user)
      expect(party.on_guest_list?(other_user)).to be true
    end

    it 'returns false when user is not on list' do
      party = Party.create(valid_attributes)
      expect(party.on_guest_list?(other_user)).to be false
    end
  end
end
