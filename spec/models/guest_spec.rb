require 'rails_helper'

describe Guest, type: :model do
  let(:person) do
    Person.create(
      email: 'foo@bar.baz',
      first_name: 'Esmeralda',
      last_name: 'Densivilla'
    )
  end
  let(:inviter) do
    Person.create(
      email: 'hugo@hase.de',
      first_name: 'Hugo',
      last_name: 'Hase'
    )
  end
  let(:valid_attributes) do
    { inviter_id: inviter.id, person_id: person.id }
  end

  context 'validation' do
    it 'requires a person_id' do
      expect(
        Guest.new(valid_attributes.merge(person_id: nil)).valid?
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
