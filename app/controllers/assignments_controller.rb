class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_filter :check_user, only: [:edit, :update, :destroy]
    before_filter :authorize_admin, only: [:index, :destroy, :edit, :create, :new]

  # GET /assignments
  # GET /assignments.json
  def index
    @search = Assignment.search(params[:q])
  @search.sorts = 'deadline' if @search.sorts.empty?
  @results = @search.result
  @results = @results.where(:assignment_type => "Open") unless params[:q]
  @assignments = @results  
  end


  # GET /assignments/1
  # GET /assignments/1.json
  def show

  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignments_path, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:document, :delete_document, :assignment_type, {lesson_ids: []}, {submission_ids: []}, :lesson, :score, :fake_score, :lesson_id, :submission, :submission_id, :name, :description, :deadline)
    end
    def check_user
      if current_user == authorize_admin
        redirect_to root_url, alert: "Nice try! Access Denied! :)", class: 'alert alert-danger'
      end 
    end
end
