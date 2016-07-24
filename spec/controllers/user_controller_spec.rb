require 'rails_helper'

describe UserController, type: :controller do
  let(:valid_attributes) do
    {
      first_name: 'Hugo', last_name: 'Hase', email: 'hugo@hase.de'
    }
  end

  describe 'POST create' do
    it 'creates a new User record' do
      expect do
        post :create, params: { user: valid_attributes }
      end.to change { User.count }.by(1)
      assert_template 'user/show'
    end
  end

  describe 'GET index' do
    it 'gets all user records' do
      User.create valid_attributes
      User.create valid_attributes.merge(email: 'other@mail.de')
      get :index
      assert_equal User.all, assigns(:users)
      assert_template 'user/index'
    end
  end

  describe 'DELETE delete' do
    it 'deletes a user' do
      user = User.create valid_attributes
      expect do
        delete :destroy, params: { id: user.id }
      end.to change { User.count }.by(-1)
      expect do
        User.find user.id
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET show' do
    it 'loads the right user' do
      user = User.create valid_attributes
      get :show, params: { id: user.id }
      assert_equal user, assigns(:user)
      assert_template 'user/show'
    end
  end

  describe 'PUT update' do
    it 'updates a user record' do
      user = User.create valid_attributes
      changed_attributes = {
        first_name: 'Ingo', last_name: 'Igel', email: 'ingo@igel.de'
      }
      put :update, params: { user: changed_attributes, id: user.id }
      user.reload
      changed_attributes.each do |attribute, value|
        expect(user.send(attribute)).to eq value
      end
      assert_template 'user/show'
    end
  end
end
