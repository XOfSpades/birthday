require 'rails_helper'

describe GuestController, type: :controller do
  let(:user) do
    User.create(
      password: 'foobarbaz',
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end
  let(:other_user) do
    User.create(
      password: 'foobarbaz',
      first_name: 'Kira',
      last_name: 'Katze',
      email: 'kira@katze.de'
    )
  end
  let(:party) do
    Party.create(
      date: Date.new(2016, 8, 6), title: 'Birthday', user: other_user
    )
  end

  before do
    expect(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'POST#create' do
    it 'creates a new guest relation' do
      expect do
        post :create, params: { guest: { party_id: party.id } }
      end.to change { Guest.count }.by(1)
      assert_template 'party/show'
    end
  end
end
