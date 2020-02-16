# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Move. As you add validations to Move, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      type: 'Moves::Basic',
      name: 'Act Under Pressure',
      rating: 'cool'
    }
  end

  let(:invalid_attributes) do
    {
      type: ''
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MovesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in create(:user)
  end

  describe 'GET #index' do
    subject { get :index, params: params, session: valid_session, format: format_type }

    let(:format_type) { :html }
    let(:params) { {} }
    it 'returns a success response' do
      Move.create! valid_attributes
      subject
      expect(response).to be_successful
    end

    context 'json format' do
      let(:format_type) { :json }
      render_views

      context 'when playbook_id is supplied' do
        let(:playbook) { create :playbook }
        let(:params) { { playbook_id: playbook.id } }
        let!(:move) { create(:move, playbook: playbook) }
        let!(:another_pb_move) { create :move }

        it 'filters for moves associated with playbook' do
          subject
          resp = JSON.parse(response.body)
          expect(resp.dig(0, 'id')).to eq(move.id)
          expect(resp.count).to eq 1
        end
      end

      context 'for a hunter' do
        let(:params) { { hunter_id: hunter.id} }
        let(:hunter) { create :hunter }
        let!(:move) { create :move }

        it 'does not include has_move' do
          subject
          resp = JSON.parse(response.body)
          expect(resp.dig(0, 'has_move')).to eq false
        end

        context 'hunter has the move' do
          before { hunter.moves << move }

          it 'display if the hunter has the move' do
            subject
            resp = JSON.parse(response.body)
            expect(resp.dig(0, 'has_move')).to eq true
          end
        end
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      move = Move.create! valid_attributes
      get :show, params: { id: move.to_param }, session: valid_session
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
      move = Move.create! valid_attributes
      get :edit, params: { id: move.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Move' do
        expect do
          post :create, params: { move: valid_attributes }, session: valid_session
        end.to change(Move, :count).by(1)
      end

      it 'redirects to the created move' do
        post :create, params: { move: valid_attributes }, session: valid_session
        expect(response).to redirect_to(move_url(Move.last))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { move: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested move' do
        move = Move.create! valid_attributes
        put :update, params: { id: move.to_param, move: new_attributes }, session: valid_session
        move.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the move' do
        move = Move.create! valid_attributes
        put :update, params: { id: move.to_param, move: valid_attributes }, session: valid_session
        expect(response).to redirect_to(move_url(move))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        move = Move.create! valid_attributes
        put :update, params: { id: move.to_param, move: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested move' do
      move = Move.create! valid_attributes
      expect do
        delete :destroy, params: { id: move.to_param }, session: valid_session
      end.to change(Move, :count).by(-1)
    end

    it 'redirects to the moves list' do
      move = Move.create! valid_attributes
      delete :destroy, params: { id: move.to_param }, session: valid_session
      expect(response).to redirect_to(moves_url)
    end
  end
end
