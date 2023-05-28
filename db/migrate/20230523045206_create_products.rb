class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 100, null: false # Al parecer, unique: true esta presente a partir de Rails 4
      t.text :description # limit no es aplicable a text
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :products, :name, unique: true
  end
end
