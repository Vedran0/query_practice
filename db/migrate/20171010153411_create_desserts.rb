class CreateDesserts < ActiveRecord::Migration
  def change
    create_table :desserts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
