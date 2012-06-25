
class ProjectRequirementsController < ApplicationController
  # GET /project_requirements
  # GET /project_requirements.json
  def index
    @project_requirements = ProjectRequirement.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_requirement }
    end
  end

  # GET /project_requirements/1/edit
  def edit
    @project_requirement = ProjectRequirement.find(params[:id])
  end

  # POST /project_requirements
  # POST /project_requirements.json
  def create
    @project_requirement = ProjectRequirement.new(params[:project_requirement])

    respond_to do |format|
      if @project_requirement.save
        format.html { redirect_to @project_requirement, notice: 'Project requirement was successfully created.' }
        format.json { render json: @project_requirement, status: :created, location: @project_requirement }
      else
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
end
