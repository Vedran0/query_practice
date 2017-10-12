class SolutionsController < ApplicationController
  before_action :set_query_task, only: [:new]
  before_action :set_solution, only: [:edit, :update, :destroy, :run_solution]
  before_action :check_if_owner, only: [:edit, :destroy]

  def new
    if @query_task.solved_by(current_user)
      @solution = Solution.find_by(user_id: current_user.id, query_task_id: @query_task.id)
    else
      @solution = @query_task.solutions.new
    end
  end

  def edit
    @query_task = @solution.query_task
  end

  def create
    @solution = current_user.solutions.new(solution_params)
    respond_to do |format|
      if @solution.save
        format.html { redirect_to query_task_path(@solution.query_task), notice: 'Solution was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to query_task_path(@solution.query_task), notice: 'Solution was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # def destroy
  #   @solution.destroy
  #   respond_to do |format|
  #     format.html { redirect_to query_task_path(@solution.query_task), notice: 'Solution was successfully destroyed.' }
  #   end
  # end

  def run_solution
  begin
    eval("@objects=#{@solution.code}")
  rescue
    @bad_query = "Something is wrong :("
  end
    respond_to do |format|
      format.js
    end
  end

  private

    def set_solution
      @solution = Solution.find(params[:id])
    end

    def set_query_task
      @query_task = QueryTask.find(params[:query_task_id])
    end

    def solution_params
      params.require(:solution).permit(:code, :query_task_id)
    end

    def check_if_owner
      redirect_to @solution.query_task, alert: "It's not your solution!" if @solution.user != current_user
    end

end