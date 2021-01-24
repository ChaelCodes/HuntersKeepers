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
      rating: 'cool',
      description: 'Description'
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
  let(:user) { create :user }
  let(:body) { JSON.parse(response.body) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject(:get_index) do
      get :index,
          params: params,
          session: valid_session,
          format: format_type
    end

    let(:format_type) { :html }
    let(:params) { {} }

    it 'returns a success response' do
      Move.create! valid_attributes
      get_index
      expect(response).to be_successful
    end

    context 'with json format' do
      let(:format_type) { :json }

      render_views

      context 'sorted by type' do
        let!(:rollable_move) { create :moves_rollable }
        let!(:basic_move) { create :moves_basic }
  
        it 'is sorted by type' do
          get_index
          expect(body.dig(0, "name")).to eq 'Act Under Pressure'
        end
      end

      context 'when playbook_id is supplied' do
        let(:playbook) { create :playbook }
        let(:params) { { playbook_id: playbook.id } }
        let!(:move) { create(:move, playbook: playbook) }
        let!(:another_pb_move) { create :move }

        it 'filters for moves associated with playbook' do
          get_index
          expect(body).to all(include('id' => move.id))
        end
      end

      context 'with a hunter' do
        let(:params) { { hunter_id: hunter.id } }
        let(:hunter) { create :hunter }
        let!(:move) { create :move }
        let!(:hunter_has_move) { create :move }
        before do
          hunter.moves << hunter_has_move
          hunter.save
        end

        it 'does not include moves the hunter does not have' do
          get_index
          expect(body.find { |json_move| json_move['id'] == move.id}).to be_nil
        end

        context ' when include_all_moves' do
          let(:params) { { hunter_id: hunter.id, include_all_moves: 'true' } }
          it 'does not include has_move' do
            get_index
            expect(body.find { |json_move| json_move['id'] == move.id}['has_move']).to be_falsey
          end
        end

        context 'when hunter has the move' do
          before { hunter.moves << move }

          it 'display if the hunter has the move' do
            get_index
            expect(body.dig(0, 'has_move')).to eq true
          end
        end
      end
    end
  end

  describe 'GET #show' do
    subject(:get_show) do
      get :show, params: params, session: valid_session, format: format_type
    end

    let(:move) { create :move }
    let(:params) { { id: move.to_param } }

    context 'when json format' do
      let(:format_type) { :json }

      render_views
      it 'returns a success response' do
        get_show
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #roll' do
    subject(:get_roll) do
      get :roll, params: params, session: valid_session, format: format_type
    end

    let(:move) { create :move }
    let(:params) { { id: move.to_param } }
    let(:body) { super().with_indifferent_access }

    context 'when json format' do
      let(:format_type) { :json }

      render_views
      context 'when hunter is passed' do
        let(:params) { { id: move.to_param, hunter_id: hunter.id } }
        let(:hunter) { create :hunter }

        it 'includes results' do
          get_roll
          expect(body[:results]).to be_nil
          # TODO: error on unrollable move
        end

        context 'with a rollable move' do
          let(:move) { create :moves_rollable }

          it 'returns the results of rolling the move' do
            get_roll
            expect(body[:results]).to match(/Your total \d+ resulted in/)
          end

          context 'when lucky roll' do
            let(:params) do
              { id: move.to_param, hunter_id: hunter.id, lucky: true }
            end

            let(:hunter) { create :hunter, sharp: 1 }
            let(:move) { create :moves_rollable, rating: :sharp }

            it 'always rolls a 12' do
              get_roll
              expect(body).to include(
                roll: 13,
                results: 'Your total 13 resulted in ten plus result',
                luck_effect: hunter.playbook.luck_effect
              )
            end

            context 'when experience is lost' do
              let(:params) do
                {
                  id: move.to_param,
                  hunter_id: hunter.id,
                  lucky: true,
                  lose_experience: true
                }
              end

              it 'hunter loses the experience from failure' do
                get_roll
                expect(hunter.reload.experience).to eq(-1)
              end

              it 'hunter gets the best result' do
                get_roll
                expect(body).to include(
                  roll: 13,
                  results: 'Your total 13 resulted in ten plus result'
                )
              end
            end
          end
        end

        context 'with a basic move' do
          let(:move) { create :moves_basic }

          it 'returns the results of rolling the move' do
            get_roll
            expect(body[:results]).to match(/Your total \d+ resulted in/)
          end
        end
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
    it 'returns a success response' do
      move = Move.create! valid_attributes
      get :edit, params: { id: move.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject(:post_create) do
      post :create, params: { move: attributes }, session: valid_session
    end

    context 'with valid params' do
      let(:attributes) { valid_attributes }

      it 'creates a new Move' do
        expect { post_create }.to change(Move, :count).by(1)
      end

      it 'redirects to the created move' do
        post_create
        expect(response).to redirect_to(move_url(Move.last))
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
          params: { id: move.to_param, move: new_attributes },
          session: valid_session
    end

    let!(:move) { create :move }

    context 'with valid params' do
      let(:new_attributes) do
        {
          name: 'New Move Name'
        }
      end

      it 'updates the requested move' do
        put_update
        expect(move.reload.name).to eq 'New Move Name'
      end

      it 'redirects to the move' do
        put_update
        expect(response).to redirect_to(move_url(move))
      end
    end

    context 'with invalid params' do
      let(:new_attributes) { invalid_attributes }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put_update
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy, params: { id: move.to_param }, session: valid_session
    end

    let!(:move) { create :move }

    it 'destroys the requested move' do
      expect { delete_destroy }.to change(Move, :count).by(-1)
    end

    it 'redirects to the moves list' do
      delete_destroy
      expect(response).to redirect_to(moves_url)
    end
  end
end
