require 'rails_helper'

describe Guest, type: :model do
  let(:valid_attributes) do
    {
      email: 'foo@bar.baz',
      first_name: 'Esmeralda',
      last_name: 'Densivilla'
    }
  end

  context 'validation' do
    it 'requires a first_name' do
      expect(
        Guest.new(valid_attributes.merge(first_name: nil)).valid?
      ).to eq false
    end

    it 'requires a last_name' do
      expect(
        Guest.new(valid_attributes.merge(last_name: nil)).valid?
      ).to eq false
    end

    it 'requires a email' do
      expect(
        Guest.new(valid_attributes.merge(email: nil)).valid?
      ).to eq false
    end
  end
end
