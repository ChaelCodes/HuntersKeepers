require 'rails_helper'

RSpec.describe ImprovementsController, type: :controller do
  let(:improvement) { create :improvement }
  # This should return the minimal set of attributes required to create a valid
  # Improvement. As you add validations to Improvement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      description: 'Gain an Ally'
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

  describe 'GET #index' do
    subject { get :index, params: {}, session: valid_session }

    it 'returns a success response' do
      improvement
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: improvement.to_param }, session: valid_session }

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
    subject { get :edit, params: { id: improvement.to_param }, session: valid_session }

    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { improvement: attributes }, session: valid_session, format: format_type }

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      context 'html format' do
        let(:format_type) { :html }

        it 'creates a new Improvement' do
          expect { subject }.to change(Improvement, :count).by(1)
        end

        it 'redirects to the created improvement' do
          subject
          expect(response).to redirect_to(Improvement.last)
        end
      end

      context 'json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :created }
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

        it { is_expected.to have_http_status :unprocessable_entity }

        it 'returns the errors' do
          subject
          resp = JSON.parse(response.body)
          expect(resp['description']).to include "can't be blank"
        end
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { id: improvement.to_param, improvement: attributes }, session: valid_session, format: format_type }

    context 'with valid params' do
      let(:attributes) {{ description: 'Retire this hunter to safety' }}

      context 'html format' do
        let(:format_type) { :html }

        it 'updates the requested improvement' do
          subject
          improvement.reload
          expect(improvement.description).to eq 'Retire this hunter to safety'
        end

        it 'redirects to the improvement' do
          subject
          expect(response).to redirect_to(improvement)
        end
      end

      context 'json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :ok }
      end
    end

    context 'with invalid params' do
      let(:attributes) { invalid_attributes }

      context 'html format' do
        let(:format_type) { :html }

        it "returns a success response (i.e. to display the 'edit' template)" do
          subject
          expect(response).to be_successful
        end
      end

      context 'json format' do
        let(:format_type) { :json }

        it { is_expected.to have_http_status :unprocessable_entity }

        it 'shows the errors' do
          subject
          resp = JSON.parse(response.body)
          expect(resp['description']).to include "can't be blank"
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: improvement.to_param }, session: valid_session, format: format_type }

    context 'html format' do
      let(:format_type) { :html }

      it 'destroys the requested improvement' do
        improvement
        expect { subject }.to change(Improvement, :count).by(-1)
      end

      it 'redirects to the improvements list' do
        subject
        expect(response).to redirect_to(improvements_url)
      end
    end

    context 'json format' do
      let(:format_type) { :json }

      it { is_expected.to be_successful }
    end
  end

end
