# frozen_string_literal: true

# Restful controller for Moves
class MovesController < ApplicationController
  before_action :set_move, only: %i[roll show edit update destroy]

  # GET /moves
  # GET /moves.json
  def index
    @moves = params[:basic] ? Moves::Basic.all : Move.all
    with_hunter if params[:hunter_id]
    if params[:playbook_id]
      @moves = @moves.where(playbook_id: params[:playbook_id])
    end
    @moves = @moves.order(:type, :name)
  end

  # GET /moves/1
  # GET /moves/1.json
  def show; end

  # GET /moves/1/roll
  # GET /moves/1/roll.json
  def roll
    hunter = Hunter.find_by(id: params[:hunter_id])
    # TODO: raise complaint id unrollable
    return unless hunter && @move.rollable?
    roll_results = if params[:lucky]
                     @luck_effect = hunter.playbook.luck_effect
                     @move.lucky_roll(hunter, params[:lose_experience])
                   else
                     @move.roll_results(hunter)
                   end
    @results = roll_results.result
    @roll = roll_results.roll
  end

  # GET /moves/new
  def new
    @move = Move.new
    authorize @move
  end

  # GET /moves/1/edit
  def edit() end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(move_params)
    authorize @move
    respond_to do |format|
      if @move.save
        format.html { redirect_to move_path(@move), notice: 'Move was successfully created.' }
        format.json { render :show, status: :created, location: @move }
      else
        format.html { render :new }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moves/1
  # PATCH/PUT /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to move_path(@move), notice: 'Move was successfully updated.' }
        format.json { render :show, status: :ok, location: @move }
      else
        format.html { render :edit }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
    @move.destroy
    respond_to do |format|
      format.html { redirect_to moves_url, notice: 'Move was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def with_hunter
    unless params[:include_all_moves]
      @moves = @moves.with_hunter(params[:hunter_id])
    end
    @moves = @moves.include_hunter_moves(params[:hunter_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_move
    @move = Move.find(params[:id])
    authorize @move
  end

  # Never trust parameters from the scary internet,
  # only permit the allow list through.
  def move_params
    params.require(:move).permit(:playbook_id,
                                 :type,
                                 :name,
                                 :description,
                                 :haven,
                                 :rating,
                                 :six_and_under,
                                 :seven_to_nine,
                                 :ten_plus,
                                 :twelve_plus)
  end
end
