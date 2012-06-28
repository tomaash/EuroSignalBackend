class StatusesController < ApplicationController
  before_filter :require_user
  # GET /task_statuses
  # GET /task_statuses.json
  def index
    @task_statuses = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_statuses }
    end
  end

  # GET /task_statuses/1
  # GET /task_statuses/1.json
  def show
    @task_status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_status }
    end
  end

  # GET /task_statuses/new
  # GET /task_statuses/new.json
  def new
    @task_status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_status }
    end
  end

  # GET /task_statuses/1/edit
  def edit
    @task_status = Status.find(params[:id])
  end

  # POST /task_statuses
  # POST /task_statuses.json
  def create
    @task_status = Status.new(params[:status])

    respond_to do |format|
      if @task_status.save
        format.html { redirect_to statuses_path, notice: 'Task status was successfully created.' }
        format.json { render json: @task_status, status: :created, location: @task_status }
      else
        format.html { render action: "new" }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_statuses/1
  # PUT /task_statuses/1.json
  def update
    @task_status = Status.find(params[:id])

    respond_to do |format|
      if @task_status.update_attributes(params[:status])
        format.html { redirect_to statuses_path, notice: 'Task status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_statuses/1
  # DELETE /task_statuses/1.json
  def destroy
    @task_status = Status.find(params[:id])
    @task_status.destroy

    respond_to do |format|
      format.html { redirect_to task_statuses_url }
      format.json { head :no_content }
    end
  end
end
