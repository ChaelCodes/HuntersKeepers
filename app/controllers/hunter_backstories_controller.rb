# frozen_string_literal: true

# Handles routing requests for HunterBackstoriesController
class HunterBackstoriesController < ApplicationController
  before_action :set_hunter_backstory, only: %i[show edit update destroy]
  before_action :set_hunter, only: %i[new create]

  # GET /hunter_backstories
  # GET /hunter_backstories.json
  def index
    @hunter_backstories = HunterBackstory.all
  end

  # GET /hunter_backstories/1
  # GET /hunter_backstories/1.json
  def show; end

  # GET /hunter_backstories/new
  def new
    @hunter_backstory = HunterBackstory.new(hunter: @hunter,
                                            playbook: @hunter.playbook)
    authorize @hunter_backstory
  end

  # GET /hunter_backstories/1/edit
  def edit; end

  # POST /hunter_backstories
  # POST /hunter_backstories.json
  def create
    @hunter_backstory = HunterBackstory.new(hunter_backstory_params)
    authorize @hunter_backstory
    respond_to do |format|
      if @hunter_backstory.save
        format.html { redirect_to @hunter_backstory, notice: t('.success') }
        format.json { render :show, status: :created, location: @hunter_backstory }
      else
        format.html { render :new }
        format.json { render json: @hunter_backstory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hunter_backstories/1
  # PATCH/PUT /hunter_backstories/1.json
  def update
    respond_to do |format|
      if @hunter_backstory.update(hunter_backstory_params)
        format.html { redirect_to @hunter_backstory, notice: t('.success') }
        format.json { render :show, status: :ok, location: @hunter_backstory }
      else
        format.html { render :edit }
        format.json { render json: @hunter_backstory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hunter_backstories/1
  # DELETE /hunter_backstories/1.json
  def destroy
    @hunter_backstory.destroy
    respond_to do |format|
      format.html { redirect_to hunter_backstories_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hunter_backstory
    @hunter_backstory = HunterBackstory.find(params[:id])
    authorize @hunter_backstory
  end

  def set_hunter
    @hunter = Hunter.find(params[:hunter_id])
  end

  # Only allow a list of trusted parameters through.
  def hunter_backstory_params
    params.require(:hunter_backstory)
          .permit(:hunter_id, :playbook_id, :choices)
          .tap do |allowlisted|
            allowlisted[:choices] = params[:hunter_backstory].fetch(:choices, ActionController::Parameters.new).permit!
          end
  end
end
