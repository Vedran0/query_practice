class RemoveValidFromSolution < ActiveRecord::Migration
  def change
    remove_column :solutions, :valid, :boolean
  end
end
