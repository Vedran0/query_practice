class PasswordChange

  include ActiveModel::Model
  attr_accessor :old_password, :new_password, :password_confirmation, :user_id

  validates_presence_of :user_id, :new_password, :password_confirmation, :old_password
  validate :check_password_confirmation
  validate :check_new_password_format
  validate :check_old_password


  private

    def check_new_password_format
      if new_password.length < 8
        errors.add(:new_password, "cannot be less than 8 characters")
      end
    end

    def check_password_confirmation
      if new_password != password_confirmation
        errors.add(:password_confirmation, "not same as new_password")
      end
    end

    def check_old_password
      if !User.find(user_id).valid_password?(old_password)
        errors.add(:old_password, "wrong")
      end
    end

end
