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
end
