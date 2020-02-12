# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HuntersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Hunter. As you add validations to Hunter, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      hunter: {
        name: 'Ruudii',
        playbook_id: create(:playbook).id,
        harm: 0,
        luck: 0
      }
    }
  end

  let(:invalid_attributes) do
    {
      hunter: {
        name: 'Killua',
        playbook_id: create(:playbook).id,
        harm: 8,
        luck: 0
      }
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HuntersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in create(:user, :admin)
  end

  describe 'GET #index' do
    subject { get :index, params: {}, session: valid_session }

    context 'at least one hunter exists' do
      let!(:hunter) { create :hunter }

      it 'returns a success response' do
        subject
        expect(response).to be_successful
      end
    end

    context 'no hunters exist' do
      it 'returns a success response' do
        subject
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: hunter.id }, session: valid_session }

    let(:hunter) { create :hunter }
    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    subject { get :new, params: {}, session: valid_session }

    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: hunter.to_param }, session: valid_session }

    let(:hunter) { create :hunter }
    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject { post :create, params: attributes, session: valid_session }
    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Hunter' do
        expect { subject }.to change(Hunter, :count).by(1)
      end

      it 'redirects to the created hunter' do
        subject
        expect(response).to redirect_to(Hunter.last)
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      it "returns a success response (i.e. to display the 'new' template)" do
        subject
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: attributes.merge({ id: hunter.to_param}), session: valid_session
         }

    let!(:hunter) { create :hunter }
    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'updates the requested hunter' do
        subject
        hunter.reload
        expect(hunter.name).to eq 'Ruudii'
      end

      it 'redirects to the hunter' do
        subject
        expect(response).to redirect_to(hunter)
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      it "returns a success response (i.e. to display the 'edit' template)" do
        subject
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: hunter.to_param }, session: valid_session }

    let!(:hunter) { create :hunter }
    it 'destroys the requested hunter' do
      expect { subject }.to change(Hunter, :count).by(-1)
    end

    it 'redirects to the hunters list' do
      subject
      expect(response).to redirect_to(hunters_url)
    end
  end
end
