class PasswordChangesController < ApplicationController

  def new
    @password_change = PasswordChange.new
  end

  def create
    @password_change = PasswordChange.new(password_change_params)
    @password_change.user_id = current_user.id
    if @password_change.valid?
      current_user.update(password: @password_change.new_password)
      redirect_to root_path, notice: "Password changed!"
    else
      render 'new'
    end
  end

  private

    def password_change_params
      params.require(:password_change).permit(:old_password, :new_password, :password_confirmation, :user_id)
    end

end