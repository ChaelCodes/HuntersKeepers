# frozen_string_literal: true

# This controller handles routing for the havens endpoint
class HavensController < ApplicationController
  before_action :set_haven, only: %i[show edit update destroy]

  # GET /havens
  # GET /havens.json
  def index
    @havens = Haven.all
  end

  # GET /havens/1
  # GET /havens/1.json
  def show; end

  # GET /havens/new
  def new
    @haven = Haven.new
    authorize @haven
  end

  # GET /havens/1/edit
  def edit; end

  # POST /havens
  # POST /havens.json
  def create # rubocop:disable Metrics/MethodLength
    @haven = Haven.new(haven_params)
    @haven.user = current_user
    authorize @haven
    respond_to do |format|
      if @haven.save
        format.html do
          redirect_to @haven, notice: 'Haven was successfully created.'
        end
        format.json do
          render :show, status: :created, location: @haven
        end
      else
        format.html { render :new }
        format.json do
          render json: @haven.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /havens/1
  # PATCH/PUT /havens/1.json
  def update # rubocop:disable Metrics/MethodLength
    respond_to do |format|
      if @haven.update(haven_params)
        format.html do
          redirect_to @haven, notice: 'Haven was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @haven }
      else
        format.html { render :edit }
        format.json do
          render json: @haven.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /havens/1
  # DELETE /havens/1.json
  def destroy
    @haven.destroy
    respond_to do |format|
      format.html do
        redirect_to havens_url, notice: 'Haven was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_haven
    @haven = Haven.find(params[:id])
    authorize @haven
  end

  # Never trust parameters from the scary internet,
  # only allow the allow list through.
  def haven_params
    params.require(:haven).permit(:name, :description)
  end
end
