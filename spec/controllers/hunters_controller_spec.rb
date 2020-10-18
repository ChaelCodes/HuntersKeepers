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
        luck: 7,
        charm: 1,
        cool: 1,
        sharp: 0,
        tough: -1,
        weird: 0
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
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject(:get_index) { get :index, params: {}, session: valid_session }

    context 'when at least one hunter exists' do
      let!(:hunter) { create :hunter }

      it 'returns a success response' do
        get_index
        expect(response).to be_successful
      end
    end

    context 'without hunters' do
      it 'returns a success response' do
        get_index
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #show' do
    subject(:get_show) do
      get :show,
          params: { id: hunter.id },
          session: valid_session
    end

    let(:hunter) { create :hunter }

    it 'returns a success response' do
      get_show
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    subject(:get_new) { get :new, params: {}, session: valid_session }

    it 'returns a success response' do
      get_new
      expect(response).to be_successful
    end

    context 'when user is banned' do
      let(:user) { create(:user, :banned) }

      it 'does not display new' do
        get_new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    subject(:get_edit) do
      get :edit,
          params: { id: hunter.to_param },
          session: valid_session
    end

    let(:hunter) { create :hunter }

    context 'with admin user' do
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
           params: attributes,
           session: valid_session
    end

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Hunter' do
        expect { post_create }.to change(Hunter, :count).by(1)
      end

      it 'redirects to the created hunter' do
        post_create
        expect(response).to redirect_to(Hunter.last)
      end
    end

    context 'when provided nil harm and luck which are required attributes' do
      let(:attributes) { valid_attributes }
      let(:hidden_attributes_from_form) { {"harm": nil, "luck": nil} }

      it 'nil attributes are overwritten to defaults and creates a new Hunter' do
        attributes = valid_attributes[:hunter].merge(hidden_attributes_from_form)

        expect(attributes[:harm]).to eq nil
        expect(attributes[:luck]).to eq nil

        expect { post_create }.to change(Hunter, :count).by(1)

        expect(controller.params[:hunter][:harm]).to eq "0"
        expect(controller.params[:hunter][:luck]).to eq "7"
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
          params: attributes.merge(id: hunter.to_param),
          session: valid_session
    end

    let!(:hunter) { create :hunter }

    context 'with admin user' do
      let(:user) { create :user, :admin }

      context 'with valid params' do
        let(:attributes) { valid_attributes }

        it 'updates the requested hunter' do
          put_update
          hunter.reload
          expect(hunter.name).to eq 'Ruudii'
        end

        it 'redirects to the hunter' do
          put_update
          expect(response).to redirect_to(hunter)
        end
      end

      context 'with invalid params' do
        let(:attributes) { invalid_attributes }

        it "returns a success response (i.e. to display the 'edit' template)" do
          put_update
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy, params: { id: hunter.to_param }, session: valid_session
    end

    let!(:hunter) { create :hunter }

    it 'redirects user to sign in' do
      delete_destroy
      expect(response).to redirect_to(root_path)
    end

    context 'when user has created hunter' do
      let!(:hunter) { create :hunter, user: user }

      it 'destroys the requested hunter' do
        expect { delete_destroy }.to change(Hunter, :count).by(-1)
      end
    end

    context 'with admin user' do
      let(:user) { create :user, :admin }

      it 'destroys the requested hunter' do
        expect { delete_destroy }.to change(Hunter, :count).by(-1)
      end

      it 'redirects to the hunters list' do
        delete_destroy
        expect(response).to redirect_to(hunters_url)
      end
    end
  end
end
