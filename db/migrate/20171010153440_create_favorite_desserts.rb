class CreateFavoriteDesserts < ActiveRecord::Migration
  def change
    create_table :favorite_desserts do |t|
      t.integer :user_id
      t.integer :dessert_id

      t.timestamps null: false
    end
  end
end
