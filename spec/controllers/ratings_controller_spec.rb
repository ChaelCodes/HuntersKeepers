# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
  let(:rating) { create :rating }
  let(:valid_session) { {} }
  let(:user) { create :user, :admin }
  let(:playbook) { create :playbook }
  let(:valid_attributes) do
    {
      playbook_id: playbook.id,
      charm: 1,
      cool: 2,
      sharp: 1,
      tough: -1,
      weird: 0
    }
  end

  let(:invalid_attributes) do
    {
      charm: 1,
      cool: 2,
      sharp: 1,
      weird: nil
    }
  end

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject(:get_index) do
      get :index, params: params, session: valid_session, format: format_type
    end

    let(:format_type) { :html }
    let(:params) { {} }

    it 'returns an empty success response' do
      get_index
      expect(response).to be_successful
    end

    context 'when at least one rating exists' do
      let!(:rating) { create :rating }

      it 'returns a success response' do
        get_index
        expect(response).to be_successful
      end
    end

    context 'with json' do
      render_views
      let(:format_type) { :json }
      let(:body) { JSON.parse(response.body) }

      context 'with a playbook param' do
        let(:params) { { playbook_id: playbook.id } }
        let(:playbook) { create :playbook }
        let!(:playbook_rating) { create(:rating, playbook: playbook) }
        let!(:not_playbook_rating) { create(:rating) }

        it 'filters ratings for that playbook' do
          get_index
          expect(body).to all(include('id' => playbook_rating.id))
        end
      end
    end
  end

  describe 'GET #show' do
    subject(:get_show) { get :show, params: params, session: valid_session, format: format_type }

    let(:params) { { id: rating.id } }
    let(:format_type) { :html }

    it 'returns a success response' do
      get_show
      expect(response).to be_successful
    end

    context 'with json' do
      let(:format_type) { :json }

      it 'returns a success response' do
        get_show
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    subject(:get_edit) { get :edit, params: { id: rating.to_param }, session: valid_session }

    it 'returns a success response' do
      get_edit
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
    subject(:get_edit) do
      get :edit, params: { id: rating.to_param }, session: valid_session
    end

    it 'returns a success response' do
      get_edit
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject(:post_create) do
      post :create, params: { rating: attributes }, session: valid_session
    end

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Rating' do
        expect { post_create }.to change(Rating, :count).by(1)
      end

      it 'redirects to the created rating' do
        post_create
        expect(response).to redirect_to(rating_url(Rating.last))
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
    subject(:put_update) { put :update, params: { id: rating.to_param, rating: attributes }, session: valid_session }

    context 'with valid params' do
      let(:attributes) { { cool: 3 } }

      it 'updates the requested rating' do
        put_update
        expect(rating.reload.cool).to eq 3
      end

      it 'redirects to the rating' do
        put_update
        expect(response).to redirect_to(rating_url(rating))
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

  describe 'DELETE #destroy' do
    subject(:delete_destroy) { delete :destroy, params: { id: rating.to_param }, session: valid_session }

    it 'destroys the requested rating' do
      rating
      expect { delete_destroy }.to change(Rating, :count).by(-1)
    end

    it 'redirects to the rating list' do
      rating
      delete_destroy
      expect(response).to redirect_to(ratings_url)
    end
  end
end
