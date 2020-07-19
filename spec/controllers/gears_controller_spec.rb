# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GearsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Gear. As you add validations to Gear, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      playbook_id: create(:playbook).id,
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

  let(:user) { create :user }

  before do
    sign_in user
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
    subject(:post_create) do
      post :create, params: { gear: attributes }, session: valid_session
    end

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Gear' do
        expect do
          post_create
        end.to change(Gear, :count).by(1)
      end

      it 'redirects to the created gear' do
        post_create
        expect(response).to redirect_to(Gear.last)
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      it "returns a success response (i.e. to display the 'new' template)" do
        post_create
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    subject(:put_update) do
      put :update,
          params: { id: gear.to_param, gear: new_attributes },
          session: valid_session
    end

    let(:gear) { create :gear }

    context 'with valid params' do
      let(:new_attributes) do
        {
          name: 'Updated Gear'
        }
      end

      it 'updates the requested gear' do
        put_update
        gear.reload
        expect(gear.name).to eq 'Updated Gear'
      end

      it 'redirects to the gear' do
        put_update
        expect(response).to redirect_to(gear)
      end
    end

    context 'with invalid params' do
      let(:new_attributes) { invalid_attributes }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put_update
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy, params: { id: gear.to_param }, session: valid_session
    end

    let!(:gear) { create :gear }

    it 'destroys the requested gear' do
      expect { delete_destroy }.to change(Gear, :count).by(-1)
    end

    it 'redirects to the gears list' do
      delete_destroy
      expect(response).to redirect_to(gears_url)
    end
  end
end
