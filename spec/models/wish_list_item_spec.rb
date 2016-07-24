require 'rails_helper'

describe WishListItem, type: :model do
  let(:person) do
    Person.create(
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end
  let(:valid_atributes) do
    {
      name: 'Lego Vulkan Truck',
      location: 'Rossmann Rösrath',
      price: 17.99,
      img_url: 'www.lego.com/img_vulkan_truck_61073',
      person: person
    }
  end

  context 'validation' do
    it 'is valid when attributes are valid' do
      expect(WishListItem.new(valid_atributes).valid?).to be true
    end

    it 'requires a name' do
      expect(
        WishListItem.new(valid_atributes.merge(name: nil)).valid?
      ).to be false
    end

    it 'requires a location' do
      expect(
        WishListItem.new(valid_atributes.merge(location: nil)).valid?
      ).to be false
    end

    it 'requires a price' do
      expect(
        WishListItem.new(valid_atributes.merge(price: nil)).valid?
      ).to be false
    end

    it 'requires a img_url' do
      expect(
        WishListItem.new(valid_atributes.merge(img_url: nil)).valid?
      ).to be false
    end

    it 'requires a person' do
      expect(
        WishListItem.new(valid_atributes.merge(person: nil)).valid?
      ).to be false
    end
  end
end
