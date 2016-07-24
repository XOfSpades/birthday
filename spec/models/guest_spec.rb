require 'rails_helper'

describe Guest, type: :model do
  let(:user) do
    User.create(
      password: 'foobarbaz',
      email: 'foo@bar.baz',
      first_name: 'Esmeralda',
      last_name: 'Densivilla'
    )
  end
  let(:inviter) do
    User.create(
      password: 'foobarbaz',
      email: 'hugo@hase.de',
      first_name: 'Hugo',
      last_name: 'Hase'
    )
  end
  let(:party) do
    Party.create(
      date: Date.new(2016, 8, 6),
      title: 'The big birthday party',
      user: inviter
    )
  end
  let(:valid_attributes) do
    { party: party, user: user }
  end

  context 'validation' do
    it 'requires a user_id' do
      expect(
        Guest.new(valid_attributes.merge(user: nil)).valid?
      ).to eq false
    end

    it 'requires an inviter_id' do
      expect(
        Guest.new(valid_attributes.merge(party: nil)).valid?
      ).to eq false
    end

    it 'creates a valid Guest record' do
      expect(Guest.new(valid_attributes).valid?).to eq true
    end
  end
end
