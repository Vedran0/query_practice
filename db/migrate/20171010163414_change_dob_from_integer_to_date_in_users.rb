class ChangeDobFromIntegerToDateInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :dob, :integer
    add_column :users, :dob, :date
  end
end
