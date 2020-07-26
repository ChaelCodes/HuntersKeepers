# frozen_string_literal: true

# Restful controller for Playbooks
class PlaybooksController < ApplicationController
  before_action :set_playbook, only: %i[show edit update destroy]

  # GET /playbooks
  # GET /playbooks.json
  def index
    @playbooks = policy_scope(Playbook)
  end

  # GET /playbooks/1
  # GET /playbooks/1.json
  def show() end

  # GET /playbooks/new
  def new
    @playbook = Playbook.new
  end

  # GET /playbooks/1/edit
  def edit() end

  # POST /playbooks
  # POST /playbooks.json
  def create
    @playbook = Playbook.new(playbook_params)

    respond_to do |format|
      if @playbook.save
        format.html { redirect_to @playbook, notice: 'Playbook was successfully created.' }
        format.json { render :show, status: :created, location: @playbook }
      else
        format.html { render :new }
        format.json { render json: @playbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playbooks/1
  # PATCH/PUT /playbooks/1.json
  def update
    respond_to do |format|
      if @playbook.update(playbook_params)
        format.html { redirect_to @playbook, notice: 'Playbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @playbook }
      else
        format.html { render :edit }
        format.json { render json: @playbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playbooks/1
  # DELETE /playbooks/1.json
  def destroy
    @playbook.destroy
    respond_to do |format|
      format.html { redirect_to playbooks_url, notice: 'Playbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_playbook
    @playbook = Playbook.find(params[:id])
    authorize @playbook
  end

  # Never trust parameters from the scary internet,
  # only permit the allow list through.
  def playbook_params
    params.require(:playbook).permit(:name, :description)
  end
end
