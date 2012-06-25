
class AvailableTimesController < ApplicationController
  # GET /available_times
  # GET /available_times.json
  def index
    @available_times = AvailableTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @available_times }
    end
  end

  # GET /available_times/1
  # GET /available_times/1.json
  def show
    @available_time = AvailableTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @available_time }
    end
  end

  # GET /available_times/new
  # GET /available_times/new.json
  def new
    @available_time = AvailableTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @available_time }
    end
  end

  # GET /available_times/1/edit
  def edit
    @available_time = AvailableTime.find(params[:id])
  end

  # POST /available_times
  # POST /available_times.json
  def create
    @available_time = AvailableTime.new(params[:available_time])

    respond_to do |format|
      if @available_time.save
        format.html { redirect_to @available_time, notice: 'Available time was successfully created.' }
        format.json { render json: @available_time, status: :created, location: @available_time }
      else
        format.html { render action: "new" }
        format.json { render json: @available_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /available_times/1
  # PUT /available_times/1.json
  def update
    @available_time = AvailableTime.find(params[:id])

    respond_to do |format|
      if @available_time.update_attributes(params[:available_time])
        format.html { redirect_to @available_time, notice: 'Available time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @available_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_times/1
  # DELETE /available_times/1.json
  def destroy
    @available_time = AvailableTime.find(params[:id])
    @available_time.destroy

    respond_to do |format|
      format.html { redirect_to available_times_url }
      format.json { head :no_content }
    end
  end
end
