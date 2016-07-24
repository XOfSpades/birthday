require 'rails_helper'

describe PartyController, type: :controller do
  let(:user) do
    User.create(
      password: 'foobarbaz',
      first_name: 'Hugo',
      last_name: 'Hase',
      email: 'hugo@hase.de'
    )
  end
  let(:valid_attributes) do
    {
      date: Date.new(2016, 8, 6), title: 'Birthday', user: user
    }
  end

  before { expect(controller).to receive(:authenticate_user!).and_return(true) }

  describe 'POST create' do
    it 'creates a new Party record' do
      expect do
        post :create, params: { user_id: user.id, party: valid_attributes }
      end.to change { Party.count }.by(1)
      assert_template 'party/show'
    end
  end

  describe 'GET index' do
    it 'gets all party records' do
      parties = []
      parties << Party.create(valid_attributes)
      parties << Party.create(
        valid_attributes.merge(date: Date.new(2016, 9, 27)))
      other_user = User.create(
        password: 'foobarbaz',
        first_name: 'Ingo',
        last_name: 'Igel',
        email: 'ingo@igel.de'
      )
      Party.create valid_attributes.merge(user: other_user)
      get :index, params: { user_id: user.id }
      assert_equal parties, assigns(:parties)
      assert_template 'party/index'
    end
  end

  describe 'DELETE delete' do
    it 'deletes a party' do
      party = Party.create valid_attributes
      expect do
        delete :destroy, params: { user_id: user.id, id: party.id,  }
      end.to change { Party.count }.by(-1)
      expect do
        Party.find user.id
      end.to raise_error(ActiveRecord::RecordNotFound)
      assert_template 'party/index'
    end
  end

  describe 'GET show' do
    it 'loads the right party' do
      party = Party.create valid_attributes
      get :show, params: { user_id: user.id, id: party.id }
      assert_equal party, assigns(:party)
      assert_template 'party/show'
    end
  end

  describe 'PUT update' do
    it 'updates a party record' do
      party = Party.create valid_attributes
      changed_attributes = { date: Date.new(2016, 9, 27), title: 'X-mas' }
      params = {
        party: changed_attributes, id: party.id, user_id: user.id
      }
      put :update, params: params
      party.reload
      expect(party.date).to eq Date.new(2016, 9, 27)
      assert_template 'party/show'
    end
  end
end
