# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GearsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Gear. As you add validations to Gear, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'Gear'
    }
  end

  let(:invalid_attributes) do
    {
      name: ''
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GearsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Gear.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      gear = Gear.create! valid_attributes
      get :show, params: { id: gear.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      gear = Gear.create! valid_attributes
      get :edit, params: { id: gear.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Gear' do
        expect do
          post :create, params: { gear: valid_attributes }, session: valid_session
        end.to change(Gear, :count).by(1)
      end

      it 'redirects to the created gear' do
        post :create, params: { gear: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Gear.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { gear: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          name: 'Updated Gear'
        }
      end

      it 'updates the requested gear' do
        gear = Gear.create! valid_attributes
        put :update, params: { id: gear.to_param, gear: new_attributes }, session: valid_session
        gear.reload
        expect(gear.name).to eq 'Updated Gear'
      end

      it 'redirects to the gear' do
        gear = Gear.create! valid_attributes
        put :update, params: { id: gear.to_param, gear: valid_attributes }, session: valid_session
        expect(response).to redirect_to(gear)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        gear = Gear.create! valid_attributes
        put :update, params: { id: gear.to_param, gear: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested gear' do
      gear = Gear.create! valid_attributes
      expect do
        delete :destroy, params: { id: gear.to_param }, session: valid_session
      end.to change(Gear, :count).by(-1)
    end

    it 'redirects to the gears list' do
      gear = Gear.create! valid_attributes
      delete :destroy, params: { id: gear.to_param }, session: valid_session
      expect(response).to redirect_to(gears_url)
    end
  end
end
