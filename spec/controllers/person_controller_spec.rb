require 'rails_helper'

describe PersonController, type: :controller do
  let(:valid_attributes) do
    {
      first_name: 'Hugo', last_name: 'Hase', email: 'hugo@hase.de'
    }
  end

  describe 'POST create' do
    it 'creates a new Person record' do
      expect do
        post :create, params: { person: valid_attributes }
      end.to change { Person.count }.by(1)
      assert_template 'person/show'
    end
  end

  describe 'GET index' do
    it 'gets all person records' do
      Person.create valid_attributes
      Person.create valid_attributes.merge(email: 'other@mail.de')
      get :index
      assert_equal Person.all, assigns(:persons)
      assert_template 'person/index'
    end
  end

  describe 'DELETE delete' do
    it 'deletes a person' do
      person = Person.create valid_attributes
      expect do
        delete :destroy, params: { id: person.id }
      end.to change { Person.count }.by(-1)
      expect do
        Person.find person.id
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET show' do
    it 'loads the right person' do
      person = Person.create valid_attributes
      get :show, params: { id: person.id }
      assert_equal person, assigns(:person)
      assert_template 'person/show'
    end
  end

  describe 'PUT update' do
    it 'updates a person record' do
      person = Person.create valid_attributes
      changed_attributes = {
        first_name: 'Ingo', last_name: 'Igel', email: 'ingo@igel.de'
      }
      put :update, params: { person: changed_attributes, id: person.id }
      person.reload
      changed_attributes.each do |attribute, value|
        expect(person.send(attribute)).to eq value
      end
      assert_template 'person/show'
    end
  end
end
