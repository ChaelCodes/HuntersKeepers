# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaybooksController, type: :controller do
  let(:playbook) { create :playbook }
  let(:valid_session) { {} }
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject(:get_index) { get :index, params: {}, session: valid_session }

    it 'returns a success response' do
      playbook
      get_index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    subject(:get_show) do
      get :show, params: params, session: valid_session, format: format_type
    end

    let(:params) { { id: playbook.to_param } }

    context 'when html format' do
      let(:format_type) { :html }

      it 'returns a success response' do
        get_show
        expect(response).to be_successful
      end
    end

    context 'when json format' do
      let(:format_type) { :json }

      it 'returns a success response' do
        get_show
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #new' do
    subject(:get_new) { get :new, params: {}, session: valid_session }
    let(:user) { create :user, :admin }
    
    it 'returns a success response' do
      get_new
      expect(response).to be_successful
    end

    context 'with guest' do
      it 'redirects due to unauthorized access' do
        sign_out user
        get_new
        expect(response).to redirect_to(root_path)
      end
    end 
  end

  describe 'GET #edit' do
    subject(:get_edit) do
      get :edit,
          params: { id: playbook.to_param },
          session: valid_session
    end

    it 'redirects due to unauthorized access' do
      get_edit
      expect(response).to redirect_to(root_path)
    end

    context 'when user is admin' do
      let(:user) { create :user, :admin }

      it 'returns a success response' do
        get_edit
        expect(response).to be_successful
      end
    end
  end

  describe 'POST #create' do
    subject(:post_create) do
      post :create,
           params: { playbook: attributes },
           session: valid_session,
           format: format_type
    end

    let(:user) { create :user, :admin }

    context 'with valid params' do
      let(:attributes) { { name: 'The Unnamed' } }

      context 'when html format' do
        let(:format_type) { :html }

        it 'creates a new Playbook' do
          expect { post_create }.to change(Playbook, :count).by(1)
        end

        it 'redirects to the created playbook' do
          post_create
          expect(response).to redirect_to(Playbook.last)
        end

        context 'with backstory attributes' do
          let(:attributes) { { name: 'The Unnamed', backstory: { name: 'A NAME' } } }

          it 'creates a new Playbook' do
            expect { post_create }.to change(Playbook, :count).by(1)
            expect(Playbook.last.backstory.name).to eq 'A NAME'
          end
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :created }
      end
    end

    context 'with invalid params' do
      let(:attributes) { { name: nil } }

      context 'when html format' do
        let(:format_type) { :html }

        it 'returns a success response (renders the new form)' do
          post_create
          expect(response).to be_successful
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :unprocessable_entity }

        it 'returns the errors' do
          post_create
          resp = JSON.parse(response.body)
          expect(resp['name']).to include "can't be blank"
        end
      end
    end
  end

  describe 'PUT #update' do
    subject(:put_update) do
      put :update,
          params: { id: playbook.to_param, playbook: attributes },
          session: valid_session,
          format: format_type
    end

    let(:user) { create :user, :admin }

    context 'with valid params' do
      let(:attributes) { { name: 'The Unnamed', luck_effect: 'This is LUCK', backstory: { name: 'name' } } }

      context 'when html format' do
        let(:format_type) { :html }

        it 'updates the requested playbook' do
          put_update
          expect(playbook.reload).to have_attributes({
            name: 'The Unnamed',
            luck_effect: 'This is LUCK'
          })
          expect(playbook.backstory).to have_attributes({
            name: 'name'
          })
        end

        it 'redirects to the playbook' do
          put_update
          expect(response).to redirect_to(playbook)
        end

        context 'non-admin user' do
          it 'redirects due to unauthorized access' do
            put_update
            expect(response).to redirect_to(playbook)
          end
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :ok }
      end
    end

    context 'with invalid params' do
      let(:attributes) { { name: nil } }

      context 'when html format' do
        let(:format_type) { :html }

        it "returns a success response (i.e. to display the 'edit' template)" do
          put_update
          expect(response).to be_successful
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :unprocessable_entity }

        it 'shows the errors' do
          put_update
          resp = JSON.parse(response.body)
          expect(resp['name']).to include "can't be blank"
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy,
             params: { id: playbook.to_param },
             session: valid_session,
             format: format_type
    end

    let(:format_type) { :html }

    it 'redirects user to sign in' do
      delete_destroy
      expect(response).to redirect_to(root_path)
    end

    context 'with admin user' do
      let(:user) { create :user, :admin }

      context 'when html format' do
        let(:format_type) { :html }

        it 'destroys the requested playbook' do
          playbook
          expect { delete_destroy }.to change(Playbook, :count).by(-1)
        end

        it 'redirects to the playbooks list' do
          delete_destroy
          expect(response).to redirect_to(playbooks_url)
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to be_successful }
      end
    end
  end
end
