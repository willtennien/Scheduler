
class ProjectSolutionsController < ApplicationController
  # GET /project_solutions
  # GET /project_solutions.json
  def index
    @project_solutions = ProjectSolution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_solutions }
    end
  end

  # GET /project_solutions/1
  # GET /project_solutions/1.json
  def show
    @project_solution = ProjectSolution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_solution }
    end
  end

  # GET /project_solutions/new
  # GET /project_solutions/new.json
  def new
    @project_solution = ProjectSolution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_solution }
    end
  end

  # GET /project_solutions/1/edit
  def edit
    @project_solution = ProjectSolution.find(params[:id])
  end

  # POST /project_solutions
  # POST /project_solutions.json
  def create
    @project_solution = ProjectSolution.new(params[:project_solution])

    respond_to do |format|
      if @project_solution.save
        format.html { redirect_to @project_solution, notice: 'Project solution was successfully created.' }
        format.json { render json: @project_solution, status: :created, location: @project_solution }
      else
        format.html { render action: "new" }
        format.json { render json: @project_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_solutions/1
  # PUT /project_solutions/1.json
  def update
    @project_solution = ProjectSolution.find(params[:id])

    respond_to do |format|
      if @project_solution.update_attributes(params[:project_solution])
        format.html { redirect_to @project_solution, notice: 'Project solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_solutions/1
  # DELETE /project_solutions/1.json
  def destroy
    @project_solution = ProjectSolution.find(params[:id])
    @project_solution.destroy

    respond_to do |format|
      format.html { redirect_to project_solutions_url }
      format.json { head :no_content }
    end
  end
end
