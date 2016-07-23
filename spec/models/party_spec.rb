require 'rails_helper'

describe Party, type: :model do
  let(:person) do
    Person.create(
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end

  let(:valid_attributes) do
    {
      date: Date.new(2016, 8, 6),
      person: person
    }
  end

  context 'validation' do
    it 'requires a first_name' do
      expect(
        Party.new(valid_attributes.merge(person: nil)).valid?
      ).to eq false
    end

    it 'requires a last_name' do
      expect(
        Party.new(valid_attributes.merge(date: nil)).valid?
      ).to eq false
    end
  end
end
