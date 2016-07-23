require 'rails_helper'

describe 'Present', type: :model do
  let(:person) do
    Person.create(
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end
  let(:valid_attributes) do
    {
      name: 'Nerf-gun 334',
      img_url: 'www.nerf.com/img/11441r23412',
      person: person
    }
  end

  context 'validations' do
    it 'accepts valis attributes' do
      expect(Present.new(valid_attributes).valid?).to eq true
    end

    it 'requires a name' do
      expect(
        Present.new(valid_attributes.merge(name: nil)).valid?
      ).to eq false
    end

    it 'requires a img_url' do
      expect(
        Present.new(valid_attributes.merge(img_url: nil)).valid?
      ).to eq false
    end

    it 'requires a person' do
      expect(
        Present.new(valid_attributes.merge(person: nil)).valid?
      ).to eq false
    end

  end
end
