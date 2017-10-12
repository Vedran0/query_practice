class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:query_tasks, solutions: :query_task).find(params[:id])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end