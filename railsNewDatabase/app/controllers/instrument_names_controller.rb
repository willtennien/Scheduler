
class InstrumentNamesController < ApplicationController
  # GET /instrument_names
  # GET /instrument_names.json
  def index
    @instrument_names = InstrumentName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instrument_names }
    end
  end

  # GET /instrument_names/1
  # GET /instrument_names/1.json
  def show
    @instrument_name = InstrumentName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instrument_name }
    end
  end

  # GET /instrument_names/new
  # GET /instrument_names/new.json
  def new
    @instrument_name = InstrumentName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @instrument_name }
    end
  end

  # GET /instrument_names/1/edit
  def edit
    @instrument_name = InstrumentName.find(params[:id])
  end

  # POST /instrument_names
  # POST /instrument_names.json
  def create
    @instrument_name = InstrumentName.new(params[:instrument_name])

    respond_to do |format|
      if @instrument_name.save
        format.html { redirect_to @instrument_name, notice: 'Instrument name was successfully created.' }
        format.json { render json: @instrument_name, status: :created, location: @instrument_name }
      else
        format.html { render action: "new" }
        format.json { render json: @instrument_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /instrument_names/1
  # PUT /instrument_names/1.json
  def update
    @instrument_name = InstrumentName.find(params[:id])

    respond_to do |format|
      if @instrument_name.update_attributes(params[:instrument_name])
        format.html { redirect_to @instrument_name, notice: 'Instrument name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instrument_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrument_names/1
  # DELETE /instrument_names/1.json
  def destroy
    @instrument_name = InstrumentName.find(params[:id])
    @instrument_name.destroy

    respond_to do |format|
      format.html { redirect_to instrument_names_url }
      format.json { head :no_content }
    end
  end
end
