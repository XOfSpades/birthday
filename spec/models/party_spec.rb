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
      title: 'The big birthday party',
      person: person

    }
  end

  context 'validation' do
    it 'accepts valis attributes' do
      expect(Party.new(valid_attributes).valid?).to eq true
    end

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

    it 'requires a title' do
      expect(
        Party.new(valid_attributes.merge(title: nil)).valid?
      ).to eq false
    end
  end
end
