require 'rails_helper'

describe Person, type: :model do
  let(:valid_attributes) do
    {
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'foo@bar.de',
      gravatar: 'www.gravatar.com/hugo_hase'
    }
  end
  context 'validation' do
    it 'requires a first_name' do
      expect(
        Person.new(valid_attributes.merge(first_name: nil)).valid?
      ).to eq false
    end

    it 'requires a last_name' do
      expect(
        Person.new(valid_attributes.merge(last_name: nil)).valid?
      ).to eq false
    end

    it 'requires a email' do
      expect(
        Person.new(valid_attributes.merge(email: nil)).valid?
      ).to eq false
    end
  end
end
