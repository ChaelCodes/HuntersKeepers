# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImprovementsController, type: :controller do
  let(:improvement) { create :improvement }

  # This should return the minimal set of attributes required to create a valid
  # Improvement. As you add validations to Improvement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      description: 'Gain an Ally',
      playbook_id: create(:playbook).id
    }
  end

  let(:invalid_attributes) do
    {
      description: ''
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ImprovementsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:user) { create :user }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    subject(:get_index) { get :index, params: {}, session: valid_session }

    it 'returns a success response' do
      improvement
      get_index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    subject(:get_show) do
      get :show, params: params, session: valid_session, format: format_type
    end

    context 'when html format' do
      let(:format_type) { :html }
      let(:params) { { id: improvement.to_param } }

      it 'returns a success response' do
        get_show
        expect(response).to be_successful
      end
    end

    context 'when json format' do
      let(:format_type) { :json }

      context 'when a hunter is passed' do
        let(:hunter) { create :hunter }
        let(:params) { { id: improvement.id, hunter_id: hunter.id } }

        render_views

        context 'when improvable_options are available' do
          let!(:move) { create :move, playbook: hunter.playbook }
          let(:improvement) { create :playbook_move, playbook: hunter.playbook }

          it 'includes improvable options' do
            get_show
            resp = JSON.parse(response.body)
            expect(resp['improvable_options'].dig('move', 'data', 0, 'id')).to eq move.id
          end
        end
      end
    end
  end

  describe 'GET #new' do
    subject(:get_new) { get :new, params: {}, session: valid_session }

    it 'returns a success response' do
      get_new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    subject(:get_edit) do
      get :edit,
          params: { id: improvement.to_param },
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
           params: { improvement: attributes },
           session: valid_session,
           format: format_type
    end

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      context 'when html format' do
        let(:format_type) { :html }

        it 'creates a new Improvement' do
          expect { post_create }.to change(Improvement, :count).by(1)
        end

        it 'redirects to the created improvement' do
          post_create
          expect(response).to redirect_to(Improvement.last)
        end

        context 'with a rating boost improvement' do
          let(:attributes) do
            {
              description: 'Get +1 Tough, max +3',
              type: 'Improvements::RatingBoost',
              playbook_id: create(:playbook).id
            }
          end

          it 'redirects to created improvement' do
            post_create
            expect(response).to redirect_to(improvement_url(Improvement.last))
          end
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :created }
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

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
          expect(resp['description']).to include "can't be blank"
        end
      end
    end
  end

  describe 'PUT #update' do
    subject(:put_update) do
      put :update,
          params: { id: improvement.to_param, improvement: attributes },
          session: valid_session,
          format: format_type
    end

    context 'with valid params' do
      let(:attributes) { { description: 'Retire this hunter to safety' } }

      context 'when html format' do
        let(:format_type) { :html }

        it 'updates the requested improvement' do
          put_update
          improvement.reload
          expect(improvement.description).to eq 'Retire this hunter to safety'
        end

        it 'redirects to the improvement' do
          put_update
          expect(response).to redirect_to(improvement)
        end
      end

      context 'when json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :ok }
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

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
          expect(resp['description']).to include "can't be blank"
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy,
             params: { id: improvement.to_param },
             session: valid_session,
             format: format_type
    end

    context 'when html format' do
      let(:format_type) { :html }

      it 'destroys the requested improvement' do
        improvement
        expect { delete_destroy }.to change(Improvement, :count).by(-1)
      end

      it 'redirects to the improvements list' do
        delete_destroy
        expect(response).to redirect_to(improvements_url)
      end
    end

    context 'when json format' do
      let(:format_type) { :json }

      it { is_expected.to be_successful }
    end
  end
end
