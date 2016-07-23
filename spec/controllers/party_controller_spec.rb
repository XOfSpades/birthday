require 'rails_helper'

describe PartyController, type: :controller do
  let(:person) do
    Person.create(first_name: 'Hugo', last_name: 'Hase', email: 'hugo@hase.de')
  end
  let(:valid_attributes) do
    {
      date: Date.new(2016, 8, 6), person: person
    }
  end

  describe 'POST create' do
    it 'creates a new Party record' do
      expect do
        post :create, params: { person_id: person.id, party: valid_attributes }
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
      other_person = Person.create(
        first_name: 'Ingo', last_name: 'Igel', email: 'ingo@igel.de')
      Party.create valid_attributes.merge(person: other_person)
      get :index, person_id: person.id
      assert_equal parties, assigns(:parties)
      assert_template 'party/index'
    end
  end

  describe 'DELETE delete' do
    it 'deletes a party' do
      party = Party.create valid_attributes
      expect do
        delete :destroy, params: { person_id: person.id, id: party.id,  }
      end.to change { Party.count }.by(-1)
      expect do
        Party.find person.id
      end.to raise_error(ActiveRecord::RecordNotFound)
      assert_template 'party/index'
    end
  end

  describe 'GET show' do
    it 'loads the right party' do
      party = Party.create valid_attributes
      get :show, params: { person_id: person.id, id: party.id }
      assert_equal party, assigns(:party)
      assert_template 'party/show'
    end
  end

  describe 'PUT update' do
    it 'updates a party record' do
      party = Party.create valid_attributes
      changed_attributes = { date: Date.new(2016, 9, 27) }
      params = {
        party: changed_attributes, id: party.id, person_id: person.id
      }
      put :update, params: params
      party.reload
      expect(party.date).to eq Date.new(2016, 9, 27)
      assert_template 'party/show'
    end
  end
end
