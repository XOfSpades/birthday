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
  let(:valid_attributes) do
    { inviter_id: inviter.id, user_id: user.id }
  end

  context 'validation' do
    it 'requires a user_id' do
      expect(
        Guest.new(valid_attributes.merge(user_id: nil)).valid?
      ).to eq false
    end

    it 'requires an inviter_id' do
      expect(
        Guest.new(valid_attributes.merge(inviter_id: nil)).valid?
      ).to eq false
    end

    it 'creates a valid Guest record' do
      expect(Guest.new(valid_attributes).valid?).to eq true
    end
  end
end
