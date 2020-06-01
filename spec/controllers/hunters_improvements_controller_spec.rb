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

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user)
  end

  describe 'GET #index' do
    subject { get :index, params: { hunter_id: hunter.id }, session: valid_session }

    it 'returns a success response' do
      hunters_improvement
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { hunter_id: hunter.id, id: hunters_improvement.id }, session: valid_session }

    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    subject { get :new, params: { hunter_id: hunter.id }, session: valid_session }

    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { hunter_id: hunter.id, id: hunters_improvement.to_param }, session: valid_session }

    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { hunter_id: hunter.id, hunters_improvement: attributes }, session: valid_session, format: format_type }

    context 'with valid params' do
      let(:valid_improvement) { create(:improvement, playbook: hunter.playbook) }
      let(:attributes) { { hunter_id: hunter.id, improvement_id: valid_improvement.id } }

      context 'html format' do
        let(:format_type) { :html }

        it 'creates a new HuntersImprovement' do
          expect { subject }.to change(HuntersImprovement, :count).by(1)
        end

        it 'redirects to the created hunters_improvement' do
          subject
          expect(response).to redirect_to(hunter_hunters_improvement_url(hunter_id: hunter.id, id: HuntersImprovement.last.id))
        end
      end

      context 'with JSON Format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:created) }
      end

      context 'with json improvable' do
        let(:attributes) { { hunter_id: hunter.id, improvement_id: valid_improvement.id, improvable: '{"id":25,"name":"Ancient Fighting Arts","description":"When using an old-fashioned hand weapon, you inflict +1 harm and get +1\nwhenever you roll protect someone."}' } }
        let(:format_type) { :html }

        it 'creates a new HuntersImprovement' do
          expect { subject }.to change(HuntersImprovement, :count).by(1)
        end

        it 'has a well-formatted json improvable' do
          subject
          expect(HuntersImprovement.last.improvable['id']).to eq 25
        end
      end

      context 'with json improvable array' do
        let(:attributes) { { hunter_id: hunter.id, improvement_id: valid_improvement.id, improvable: ['{"id":25,"name":"Ancient Fighting Arts","description":"When using an old-fashioned hand weapon, you inflict +1 harm and get +1\nwhenever you roll protect someone."}', '{"id":25,"name":"Ancient Fighting Arts","description":"When using an old-fashioned hand weapon, you inflict +1 harm and get +1\nwhenever you roll protect someone."}'] } }
        let(:format_type) { :html }

        it 'creates a new HuntersImprovement' do
          expect { subject }.to change(HuntersImprovement, :count).by(1)
        end

        it 'has a well-formatted json improvable' do
          subject
          expect(HuntersImprovement.last.improvable[0]['id']).to eq 25
        end
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      context 'html format' do
        let(:format_type) { :html }

        it "returns a success response (i.e. to display the 'new' template)" do
          subject
          expect(response).to be_successful
        end
      end

      context 'json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:unprocessable_entity) }

        it 'send errors in our json response' do
          subject
          resp = JSON.parse(response.body)
          expect(resp['hunter'].to_s).to include 'does not match improvement playbook: '
        end
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { hunter_id: hunter.id, id: hunters_improvement.id, hunters_improvement: attributes }, session: valid_session, format: format_type }

    let(:different_improvement) { create(:improvement) }

    context 'with valid params' do
      let(:attributes) do
        {
          id: hunters_improvement.id,
          hunter_id: hunter.id,
          improvement_id: different_improvement.id
        }
      end

      context 'html format' do
        let(:format_type) { :html }

        it 'updates the requested hunters_improvement' do
          subject
          hunters_improvement.reload
          expect(hunters_improvement.improvement).to eq different_improvement
        end

        it 'redirects to the hunters_improvement' do
          subject
          expect(response).to redirect_to(hunter_hunters_improvement_url(hunter_id: hunter.id, id: hunters_improvement.id))
        end
      end

      context 'json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:ok) }
      end
    end

    context 'with invalid params' do
      let(:attributes) { { improvement_id: nil } }

      context 'html format' do
        let(:format_type) { :html }

        it "returns a success response (i.e. to display the 'edit' template)" do
          subject
          expect(response).to be_successful
        end
      end

      context 'json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status(:unprocessable_entity) }

        it 'send errors in our json response' do
          subject
          resp = JSON.parse(response.body)
          expect(resp['improvement']).to include 'must exist'
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { hunter_id: hunter.id, id: hunters_improvement.id }, session: valid_session, format: format_type }

    context 'with html format' do
      let(:format_type) { :html }

      it 'destroys the requested hunters_improvement' do
        hunters_improvement
        expect do
          subject
        end.to change(HuntersImprovement, :count).by(-1)
      end

      it 'redirects to the hunters_improvements list' do
        hunters_improvement
        subject
        expect(response).to redirect_to(hunter_hunters_improvements_url)
      end
    end

    context 'with json format' do
      let(:format_type) { :json }

      it { is_expected.to be_successful }
    end
  end
end
