class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :edit_password, :update_password, :update, :destroy]
  before_action :check_if_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:query_tasks, solutions: :query_task).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User Created"
    else
      render 'new', notice: "Something went wrong, user not created!"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User updated!"
    else
      render 'edit', notice: "Something went wrong, user not updated!"
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "User destroyed"
    else
      redirect_to users_path, notice: "Something went wrong, user not destroyed!"
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :admin)
    end

    def check_if_admin
      redirect_to root_path, alert: "You have no power here!" if !current_user.admin
    end

end