class QueryTasksController < ApplicationController
  before_action :set_query_task, only: [:show, :edit, :update, :destroy]
  before_action :get_list_of_models, only: [:new, :edit]

  def index
    @query_tasks = QueryTask.includes(solutions: :user).all
  end

  def show
  end

  def new
    @query_task = current_user.query_tasks.new
  end

  def edit
  end

  def create
    @query_task = current_user.query_tasks.new(query_task_params)

    respond_to do |format|
      if @query_task.save
        format.html { redirect_to @query_task, notice: 'Query task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @query_task.update(query_task_params)
        format.html { redirect_to @query_task, notice: 'Query task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @query_task.destroy
    respond_to do |format|
      format.html { redirect_to query_tasks_url, notice: 'Query task was successfully destroyed.' }
    end
  end

  private
    def set_query_task
      @query_task = QueryTask.includes(solutions: :user).find(params[:id])
    end

    def query_task_params
      params.require(:query_task).permit(:name, :description, :user_id, :resource, :singularize, :solution_template)
    end

    def get_list_of_models
      @models_singularized = []
      @models_pluralized = []
      @models = (ActiveRecord::Base.connection.tables.map.to_a - ["users", "schema_migrations", "solutions", "query_tasks", "comments"])
      @models.each do |model|
        @models_singularized << "<option>"+model.singularize+"</option>"
        @models_pluralized << "<option>"+model+"</option>"
      end
    end

end