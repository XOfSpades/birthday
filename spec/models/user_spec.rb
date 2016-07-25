require 'rails_helper'

describe User, type: :model do
  let(:valid_attributes) do
    {
      password: 'foobarbaz',
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'foo@bar.de',
      gravatar: 'www.gravatar.com/hugo_hase'
    }
  end
  context 'validation' do
    it 'accepts valis attributes' do
      expect(User.new(valid_attributes).valid?).to eq true
    end

    it 'requires a first_name' do
      expect(
        User.new(valid_attributes.merge(first_name: nil)).valid?
      ).to eq false
    end

    it 'requires a last_name' do
      expect(
        User.new(valid_attributes.merge(last_name: nil)).valid?
      ).to eq false
    end

    it 'requires a email' do
      expect(
        User.new(valid_attributes.merge(email: nil)).valid?
      ).to eq false
    end
  end

  describe 'full_name' do
    it 'returns the full_name' do
      user = User.new(valid_attributes)
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end

  describe '#on_guest_list' do
    let(:user) { User.create(valid_attributes) }
    let(:inviter1) do
      User.create(
        password: 'foobarbaz',
        first_name: 'Ingo',
        last_name: 'Igel',
        email: 'ingo@igel.de',
        gravatar: 'www.gravatar.com/ingo_igel'
      )
    end
    let(:inviter2) do
      User.create(
        password: 'foobarbaz',
        first_name: 'Kira',
        last_name: 'Katze',
        email: 'kira@katze.de',
        gravatar: 'www.gravatar.com/kira_katze'
      )
    end
    let(:party_one) do
      Party.create(
        date: Date.new(2016, 8, 6),
        title: 'The big birthday party',
        user: inviter1
      )
    end
    let(:party_two) do
      Party.create(
        date: Date.new(2016, 9, 27),
        title: 'The other big birthday party',
        user: inviter2
      )
    end

    it 'returns a list of parties you have signed to' do
      guest1 = Guest.create(user: user, party: party_one)
      guest2 = Guest.create(user: user, party: party_two)
      guest_list = user.on_guest_list
      expect(guest_list.size).to eq 2
      expect(guest_list).to include(guest1)
      expect(guest_list).to include(guest2)
    end
  end
end
