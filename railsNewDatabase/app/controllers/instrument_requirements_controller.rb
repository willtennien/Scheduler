
class InstrumentRequirementsController < ApplicationController
  # GET /instrument_requirements
  # GET /instrument_requirements.json
  def index
    @instrument_requirements = InstrumentRequirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instrument_requirements }
    end
  end

  # GET /instrument_requirements/1
  # GET /instrument_requirements/1.json
  def show
    @instrument_requirement = InstrumentRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instrument_requirement }
    end
  end

  # GET /instrument_requirements/new
  # GET /instrument_requirements/new.json
  def new
    @instrument_requirement = InstrumentRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @instrument_requirement }
    end
  end

  # GET /instrument_requirements/1/edit
  def edit
    @instrument_requirement = InstrumentRequirement.find(params[:id])
  end

  # POST /instrument_requirements
  # POST /instrument_requirements.json
  def create
    @instrument_requirement = InstrumentRequirement.new(params[:instrument_requirement])

    respond_to do |format|
      if @instrument_requirement.save
        format.html { redirect_to @instrument_requirement, notice: 'Instrument requirement was successfully created.' }
        format.json { render json: @instrument_requirement, status: :created, location: @instrument_requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @instrument_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /instrument_requirements/1
  # PUT /instrument_requirements/1.json
  def update
    @instrument_requirement = InstrumentRequirement.find(params[:id])

    respond_to do |format|
      if @instrument_requirement.update_attributes(params[:instrument_requirement])
        format.html { redirect_to @instrument_requirement, notice: 'Instrument requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instrument_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_requirements/1
  # DELETE /instrument_requirements/1.json
  def destroy
    @instrument_requirement = InstrumentRequirement.find(params[:id])
    @instrument_requirement.destroy

    respond_to do |format|
      format.html { redirect_to instrument_requirements_url }
      format.json { head :no_content }
    end
  end
end
