
class ProjectRequirementsController < ApplicationController
  # GET /project_requirements
  # GET /project_requirements.json

  def index
    @project_requirements = ProjectRequirement.where(user_id: session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_requirements }
    end
  end

  # GET /project_requirements/1
  # GET /project_requirements/1.json
  def show
    @project_requirement = ProjectRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_requirement }
    end
  end

  # GET /project_requirements/new
  # GET /project_requirements/new.json
  def new
    @project_requirement = ProjectRequirement.new
    prepare_form

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_requirement }
    end
  end

  # GET /project_requirements/1/edit
  def edit
    @project_requirement = ProjectRequirement.find(params[:id])
    prepare_form
  end

  # POST /project_requirements
  # POST /project_requirements.json
  def create
    if session[:user_id]
        s = params[:project_requirement][:soundproofness]
        if s
          params[:project_requirement][:soundproofness] = Soundproofness.new(name: s)
        else
          params[:project_requirement][:soundproofness] = Soundproofness.new(name: Soundproofness.lowest)
        end
        @project_requirement = ProjectRequirement.new(params[:project_requirement])
        @project_requirement.user_id = session[:user_id]
        # params[:instrument_names].each do |instr_name|
        #   InstrumentRequirement.create instrument_name: InstrumentName.new(instr_name), project_requirement: @project_requirement
        # end
    else
      check_authentication "Please login to create a new project."
    end

    respond_to do |format|
      if @project_requirement.save
        format.html { redirect_to @project_requirement, notice: 'Project requirement was successfully created.' }
        format.json { render json: @project_requirement, status: :created, location: @project_requirement }
      else
        prepare_form
        format.html { render action: "new" }
        format.json { render json: @project_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_requirements/1
  # PUT /project_requirements/1.json
  def update
    @project_requirement = ProjectRequirement.find(params[:id])

    respond_to do |format|
      if @project_requirement.update_attributes(params[:project_requirement])
        format.html { redirect_to @project_requirement, notice: 'Project requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_requirements/1
  # DELETE /project_requirements/1.json
  def destroy
    @project_requirement = ProjectRequirement.find(params[:id])
    @project_requirement.destroy

    respond_to do |format|
      format.html { redirect_to project_requirements_url }
      format.json { head :no_content }
    end
  end

  private 
  def prepare_form
    @possible_durations = [{text: "1 hour", value: 1}].concat (2..8).to_a.map! {|h| {text: "#{h} hours", value: h} }
  end
end
