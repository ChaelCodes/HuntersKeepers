# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HuntersImprovementsController, type: :controller do
  let(:hunter) { create :hunter }
  let(:improvement) { create :improvement }

  let(:hunters_improvement) { FactoryBot.create(:hunters_improvement) }

  # This should return the minimal set of attributes required to create a valid
  # HuntersImprovement. As you add validations to HuntersImprovement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      hunter_id: hunters_improvement.hunter.id,
      improvement_id: hunters_improvement.improvement.id
    }
  end

  let(:invalid_attributes) do
    {
      hunter_id: hunter.id,
      improvement_id: improvement.id
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HuntersImprovementsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject(:get_index) do
      get :index, params: { hunter_id: hunter.id }, session: valid_session
    end

    it 'returns a success response' do
      hunters_improvement
      get_index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    subject(:get_show) do
      get :show, params: { hunter_id: hunter.id, id: hunters_improvement.id },
                 session: valid_session
    end

    it 'returns a success response' do
      get_show
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    subject(:get_new) do
      get :new, params: { hunter_id: hunter.id }, session: valid_session
    end

    it 'returns a success response' do
      get_new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    subject(:get_edit) do
      get :edit,
          params: { hunter_id: hunter.id, id: hunters_improvement.to_param },
          session: valid_session
    end

    it 'returns a success response' do
      get_edit
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject(:post_create) do
      post :create,
           params: { hunter_id: hunter.id, hunters_improvement: attributes },
           session: valid_session,
           format: format_type
    end

    context 'with valid params' do
      let(:valid_improvement) do
        create(:improvement, playbook: hunter.playbook)
      end
      let(:attributes) do
        { hunter_id: hunter.id, improvement_id: valid_improvement.id }
      end

      context 'when html format' do
        let(:format_type) { :html }

        it 'creates a new HuntersImprovement' do
          expect { post_create }.to change(HuntersImprovement, :count).by(1)
        end

        it 'redirects to the created hunters_improvement' do
          post_create
          expect(response).to redirect_to([hunter, HuntersImprovement.last])
        end
      end

      context 'with JSON Format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:created) }
      end

      context 'with json improvable' do
        let(:attributes) do
          {
            hunter_id: hunter.id,
            improvement_id: valid_improvement.id,
            improvable: '{"move":{"id":25,"name":"Ancient Arts","description":"desc"}}'
          }
        end
        let(:format_type) { :html }

        it 'creates a new HuntersImprovement' do
          expect { post_create }.to change(HuntersImprovement, :count).by(1)
        end

        it 'has a well-formatted json improvable' do
          post_create
          expect(HuntersImprovement.last.improvable.dig("move", "id")).to eq 25
        end
      end

      context 'with json improvable array' do
        let(:attributes) do
          {
            hunter_id: hunter.id, improvement_id: valid_improvement.id,
            improvable: '{"move":[{"id":25,"name":"Ancient Arts","description":"desc"}]}'
          }
        end
        let(:format_type) { :html }

        it 'creates a new HuntersImprovement' do
          expect { post_create }.to change(HuntersImprovement, :count).by(1)
        end

        it 'has a well-formatted json improvable' do
          post_create
          expect(HuntersImprovement.last.improvable.dig("move", 0, "id")).to eq 25
        end
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      context 'when html format' do
        let(:format_type) { :html }

        it "returns a success response (i.e. to display the 'new' template)" do
          post_create
          expect(response).to be_successful
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:unprocessable_entity) }

        it 'send errors in our json response' do
          post_create
          resp = JSON.parse(response.body)
          expect(resp['hunter'])
            .to include 'does not match improvement playbook: The Nameless'
        end
      end
    end
  end

  describe 'PUT #update' do
    subject(:put_update) do
      put :update,
          params: {
            hunter_id: hunter.id,
            id: hunters_improvement.id,
            hunters_improvement: attributes
          },
          session: valid_session, format: format_type
    end

    let(:different_improvement) { create(:improvement) }

    context 'with valid params' do
      let(:attributes) do
        {
          id: hunters_improvement.id,
          hunter_id: hunter.id,
          improvement_id: different_improvement.id
        }
      end

      context 'when html format' do
        let(:format_type) { :html }

        it 'updates the requested hunters_improvement' do
          put_update
          hunters_improvement.reload
          expect(hunters_improvement.improvement).to eq different_improvement
        end

        it 'redirects to the hunters_improvement' do
          put_update
          expect(response).to redirect_to([hunter, hunters_improvement])
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:ok) }
      end
    end

    context 'with invalid params' do
      let(:attributes) { { improvement_id: nil } }

      context 'when html format' do
        let(:format_type) { :html }

        it "returns a success response (i.e. to display the 'edit' template)" do
          put_update
          expect(response).to be_successful
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:unprocessable_entity) }

        it 'send errors in our json response' do
          put_update
          resp = JSON.parse(response.body)
          expect(resp['improvement']).to include 'must exist'
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy,
             params: { hunter_id: hunter.id, id: hunters_improvement.id },
             session: valid_session, format: format_type
    end

    context 'when html format' do
      let(:format_type) { :html }

      it 'destroys the requested hunters_improvement' do
        hunters_improvement
        expect { delete_destroy }.to change(HuntersImprovement, :count).by(-1)
      end

      it 'redirects to the hunters_improvements list' do
        delete_destroy
        expect(response).to redirect_to(hunter_hunters_improvements_url)
      end
    end

    context 'when json format' do
      let(:format_type) { :json }

      it { is_expected.to be_successful }
    end
  end
end
