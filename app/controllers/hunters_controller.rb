# frozen_string_literal: true

# Restful Hunters Controller
class HuntersController < ApplicationController
  before_action :set_hunter, only: %i[show edit update destroy]

  # GET /hunters
  # GET /hunters.json
  # List all hunters
  def index
    @hunters = policy_scope(Hunter)
  end

  # GET /hunters/1
  # GET /hunters/1.json
  #
  # @param :id [Integer] An id in the Hunter table, selects the hunter to return
  # @param :available_improvements [Boolean] Toggles whether or not to include a list of improvements available to
  #   the hunter
  # @see Hunter#available_improvements
  def show
    @available_improvements = params[:available_improvements]
  end

  # GET /hunters/new
  # Routes to the new Hunter form. It initializes experience and
  # harm to 0, and luck to 7.
  def new
    @hunter = Hunter.new(experience: 0, harm: 0, luck: 7)
  end

  # GET /hunters/1/edit
  #
  # @param id [Integer] id of the Hunter to be edited
  def edit() end

  # POST /hunters
  # POST /hunters.json
  # Creates a new Hunter
  #
  # @see HuntersController#hunter_params See hunter_params for accepted parameters
  def create
    @hunter = Hunter.new(hunter_params)
    @hunter.user = current_user
    respond_to do |format|
      if @hunter.save
        format.html { redirect_to hunter_path(@hunter), notice: 'Hunter was successfully created.' }
        format.json { render :show, status: :created, location: @hunter }
      else
        format.html { render :new }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hunters/1
  # PATCH/PUT /hunters/1.json
  # Update the Hunter
  #
  # @see HuntersController#hunter_params See hunter_params for accepted parameters
  def update
    respond_to do |format|
      @hunter.user ||= current_user
      if @hunter.update(hunter_params)
        format.html { redirect_to hunter_path(@hunter), notice: 'Hunter was successfully updated.' }
        format.json { render :show, status: :ok, location: @hunter }
      else
        format.html { render :edit }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hunters/1
  # DELETE /hunters/1.json
  #
  # @param id [Integer] Id from the Hunter table of the Hunter to be destroyed
  def destroy
    @hunter.destroy
    respond_to do |format|
      format.html { redirect_to hunters_url, notice: 'Hunter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hunter
    @hunter = policy_scope(Hunter).find(params[:id])
    authorize @hunter
  end

  # [Private Method] Specify acceptable params for the Hunter object
  #
  # @param hunter [Hash] contains the following params:
  # @param name [String] the Hunter's Name
  # @param playbook_id [Integer] References the id of the Playbook in the the Playbook table
  # @param harm [Integer] The amount of Harm the hunter has taken
  # @param luck [Integer] The amount of luck the hunter has left
  # @param experience [Integer] The amount of experience the hunter has not spent.
  # @param charm [Integer] the modifier for the Hunter's charm rating
  # @param cool [Integer] the modifier for the Hunter's cool rating
  # @param sharp [Integer] the modifier for the Hunter's sharp rating
  # @param tough [Integer] the modifier for the Hunter's tough rating
  # @param weird [Integer] the modifier for the Hunter's weird rating
  # @!visibility public
  # @return [ActionController::Parameters]
  def hunter_params
    params.require(:hunter)
          .permit(:name, :playbook_id, :harm, :luck, :experience, :charm, :cool, :sharp, :tough, :weird)
  end
end
