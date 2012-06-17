class TaskNotesController < ApplicationController
  before_filter :require_user
  # GET /task_notes
  # GET /task_notes.json
  def index
    @task_notes = TaskNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_notes }
    end
  end

  # GET /task_notes/1
  # GET /task_notes/1.json
  def show
    @task_note = TaskNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_note }
    end
  end

  # GET /task_notes/new
  # GET /task_notes/new.json
  def new
    @task_note = TaskNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_note }
    end
  end

  # GET /task_notes/1/edit
  def edit
    @task_note = TaskNote.find(params[:id])
  end

  # POST /task_notes
  # POST /task_notes.json
  def create
    @task_note = TaskNote.new(params[:task_note])

    respond_to do |format|
      if @task_note.save
        format.html { redirect_to @task_note, notice: 'Task note was successfully created.' }
        format.json { render json: @task_note, status: :created, location: @task_note }
      else
        format.html { render action: "new" }
        format.json { render json: @task_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_notes/1
  # PUT /task_notes/1.json
  def update
    @task_note = TaskNote.find(params[:id])

    respond_to do |format|
      if @task_note.update_attributes(params[:task_note])
        format.html { redirect_to @task_note, notice: 'Task note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_notes/1
  # DELETE /task_notes/1.json
  def destroy
    @task_note = TaskNote.find(params[:id])
    @task_note.destroy

    respond_to do |format|
      format.html { redirect_to task_notes_url }
      format.json { head :no_content }
    end
  end
end
