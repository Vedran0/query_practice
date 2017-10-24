class RemoveTestModel < ActiveRecord::Migration
  def change
    drop_table :tests
  end
end
