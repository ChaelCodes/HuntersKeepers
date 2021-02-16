# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HavensController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Haven. As you add validations to Haven, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HavensController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:user) { create :user, :admin }

  before do
    sign_in user
  end

  let(:json_body) { JSON.parse(response.body) }

  describe 'GET #index' do
    subject(:get_index) { get :index, params: {}, session: valid_session, format: format_type }

    let!(:haven) { create :haven }
    
    context 'with html format' do
      let(:format_type) { :html }

      it 'returns a success response' do
        get_index
        expect(response).to be_successful
      end
    end

    context 'with json format' do
      let(:format_type) { :json }
      render_views

      it 'returns a success response' do
        get_index
        expect(response).to be_successful
      end

      it 'returns the haven' do
        get_index
        expect(json_body.dig(0, 'id')).to eq haven.id
      end
    end

  end

  describe 'GET #show' do
    before do
      get :show, params: { id: haven.to_param }, session: valid_session, format: format_type
    end
    subject { response }

    let(:haven) { create :haven }

    context 'with html format' do
      let(:format_type) { :html }

      it { is_expected.to be_successful }
    end

    context 'with json format' do
      let(:format_type) { :json }
      render_views

      it { is_expected.to be_successful }

      it 'returns the queried haven' do
        expect(json_body).to include(
          'id' => haven.id,
          'name' => haven.name
        )
      end
    end
  end

  describe 'GET #new' do
    before { get :new, params: {}, session: valid_session, format: format_type }
    subject { response }

    let(:haven) { build :haven }

    context 'with html format' do
      let(:format_type) { :html }

      it { is_expected.to be_successful }
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: haven.to_param }, session: valid_session, format: format_type }
    subject { response }

    let(:haven) { create :haven }

    context 'with html format' do
      let(:format_type) { :html }

      it { is_expected.to be_successful }
    end
  end

  describe 'POST #create' do
    subject(:post_create) do
      post :create, 
      params: { haven: attributes }, 
      session: valid_session, 
      format: format_type
    end
    let(:attributes) { attributes_for(:haven) }

    context 'with html format' do
      let(:format_type) { :html }

      it 'creates a new Haven' do
        expect { post_create }.to change(Haven, :count).by(1)
      end

      it 'redirects to the created haven' do
        post_create
        expect(response).to redirect_to(Haven.last)
      end

      context 'with invalid params' do
        let(:attributes) { attributes_for(:haven, name: nil) }

        it "returns a success response (and stays on the 'new' template)" do
          is_expected.to be_successful
        end
      end
    end

    context 'with json format' do
      let(:format_type) { :json }
      render_views

      it { is_expected.to be_successful }

      it 'creates a new Haven' do
        expect { post_create }.to change(Haven, :count).by(1)
      end

      context 'with invalid params' do
        let(:attributes) { attributes_for(:haven, name: nil) }

        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'PUT #update' do
    subject(:put_update) do
      put :update,
      params: { id: haven.to_param, haven: attributes },
      session: valid_session, 
      format: format_type
    end
    let(:attributes) { { name: 'Project Grimoire' } }
    let(:haven) { create :haven, name: 'Mystery Machine' }

    context 'with html format' do
      let(:format_type) { :html }

      it 'updates the haven' do
        put_update
        expect(haven.reload.name).to eq 'Project Grimoire'
      end

      it 'redirects to the updated haven' do
        is_expected.to redirect_to(haven)
      end

      context 'with invalid params' do
        let(:attributes) { { name: nil } }

        it "returns a success response (and stays on the 'edit' template)" do
          is_expected.to be_successful
        end
      end
    end

    context 'with json format' do
      let(:format_type) { :json }
      render_views

      it { is_expected.to be_successful }

      it 'updates the Haven' do
        put_update
        expect(haven.reload.name).to eq 'Project Grimoire'
      end

      context 'with invalid params' do
        let(:attributes) { { name: nil } }

        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) { delete :destroy, params: { id: haven.to_param }, session: valid_session, format: format_type }

    let!(:haven) { create :haven }

    context 'with html format' do
      let(:format_type) { :html }

      it 'destroys the requested haven' do
        expect { delete_destroy }.to change(Haven, :count).by(-1)
      end

      it 'redirects to the havens list' do
        delete_destroy
        expect(response).to redirect_to(havens_url)
      end
    end

    context 'with json format' do
      let(:format_type) { :json }

      it 'destroys the requested haven' do
        expect { delete_destroy }.to change(Haven, :count).by(-1)
      end
    end
  end
end
