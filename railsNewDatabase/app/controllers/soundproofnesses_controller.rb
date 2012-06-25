
class SoundproofnessesController < ApplicationController
  # GET /soundproofnesses
  # GET /soundproofnesses.json
  def index
    @soundproofnesses = Soundproofness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @soundproofnesses }
    end
  end

  # GET /soundproofnesses/1
  # GET /soundproofnesses/1.json
  def show
    @soundproofness = Soundproofness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @soundproofness }
    end
  end

  # GET /soundproofnesses/new
  # GET /soundproofnesses/new.json
  def new
    @soundproofness = Soundproofness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @soundproofness }
    end
  end

  # GET /soundproofnesses/1/edit
  def edit
    @soundproofness = Soundproofness.find(params[:id])
  end

  # POST /soundproofnesses
  # POST /soundproofnesses.json
  def create
    @soundproofness = Soundproofness.new(params[:soundproofness])

    respond_to do |format|
      if @soundproofness.save
        format.html { redirect_to @soundproofness, notice: 'Soundproofness was successfully created.' }
        format.json { render json: @soundproofness, status: :created, location: @soundproofness }
      else
        format.html { render action: "new" }
        format.json { render json: @soundproofness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /soundproofnesses/1
  # PUT /soundproofnesses/1.json
  def update
    @soundproofness = Soundproofness.find(params[:id])

    respond_to do |format|
      if @soundproofness.update_attributes(params[:soundproofness])
        format.html { redirect_to @soundproofness, notice: 'Soundproofness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @soundproofness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soundproofnesses/1
  # DELETE /soundproofnesses/1.json
  def destroy
    @soundproofness = Soundproofness.find(params[:id])
    @soundproofness.destroy

    respond_to do |format|
      format.html { redirect_to soundproofnesses_url }
      format.json { head :no_content }
    end
  end
end
