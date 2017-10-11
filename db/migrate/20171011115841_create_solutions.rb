class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :code
      t.boolean :valid, default: false
      t.integer :user_id
      t.integer :query_task_id

      t.timestamps null: false
    end
  end
end
