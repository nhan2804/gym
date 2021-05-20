class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :users, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.integer :quantity, null: true
      t.timestamps
    end
  end
end
