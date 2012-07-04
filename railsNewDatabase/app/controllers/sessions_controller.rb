
class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @session = Session.new

    if ((u = session[:attempted_username]))
      @username_value = u
    else
      @username_value = nil
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by_username(params[:username])
    unless user && user.authenticate(params[:password])
      session[:attempted_username] = params[:username]
      redirect_to new_session_url, notice: 'Incorrect username or password.'
    else
      @session = Session.new
      @session.user_id = user.id
      session[:user_id] = user.id

      respond_to do |format|
        if @session.save
          format.html { redirect_to user, notice: 'Welcome back!' }
        else
          format.html { render action: "new" }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    session[:user_id] = nil

    redirect_to new_session_path
  end
end
