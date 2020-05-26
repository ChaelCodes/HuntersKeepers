# frozen_string_literal: true

# This is the controller for Gear.
class GearsController < ApplicationController
  before_action :set_gear, only: %i[show edit update destroy]

  # GET /gears
  # GET /gears.json
  def index
    @hunter = Hunter.find(params[:hunter_id]) if params[:hunter_id]
    @gears = Gear.all
  end

  # GET /gears/1
  # GET /gears/1.json
  def show; end

  # GET /gears/new
  def new
    @gear = Gear.new
  end

  # GET /gears/1/edit
  def edit; end

  # POST /gears
  # POST /gears.json
  def create
    @gear = Gear.new(gear_params)

    respond_to do |format|
      if @gear.save
        format.html { redirect_to @gear, notice: 'Gear was successfully created.' }
        format.json { render :show, status: :created, location: @gear }
      else
        format.html { render :new }
        format.json { render json: @gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gears/1
  # PATCH/PUT /gears/1.json
  def update
    respond_to do |format|
      if @gear.update(gear_params)
        format.html { redirect_to @gear, notice: 'Gear was successfully updated.' }
        format.json { render :show, status: :ok, location: @gear }
      else
        format.html { render :edit }
        format.json { render json: @gear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gears/1
  # DELETE /gears/1.json
  def destroy
    @gear.destroy
    respond_to do |format|
      format.html { redirect_to gears_url, notice: 'Gear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gear
    @gear = Gear.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gear_params
    params.require(:gear).permit(:name, :description, :harm, :armor, :tag_list)
  end
end
