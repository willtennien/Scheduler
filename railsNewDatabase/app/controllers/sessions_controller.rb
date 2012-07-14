
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

      puts "NOW NAMES: #{session[:intended_controller]}, #{session[:intended_action]}"
      if (c = session[:intended_controller]) && (a = session[:intended_action])
        success_url = url_for controller: c, action: a
      else
        sucess_url = user_path user
      end

      respond_to do |format|
        if @session.save
          format.html { redirect_to sucess_url }
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
    begin
      @session = Session.find(params[:id])
      @session.destroy
    rescue
      puts " ! WARNING: I tried to delete a sessions for user-#{session[:user_id] || "a user not logged in"}. The database might have been reset while a user was logged in."
    end
    session[:user_id] = nil

    redirect_to new_session_path
  end
end
