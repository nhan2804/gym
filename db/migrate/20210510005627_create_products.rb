class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.references :category, null: false, foreign_key: true
      t.integer :price
      t.string :thumbnail

      t.timestamps
    end
  end
end
