class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 100, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :products, :name, unique: true
  end
end

# Aclaraciones:
# - unique: true está presente desde Rails 4, pero con scaffolding, se puede agregar automaticamente la línea add_index
#   > rails g model product name:uniq
#   o solo indice con
#   > rails g model product name:index
# - limit no es aplicable a text
# - El índice único sobre nombre es para no tener más de un producto con el mismo nombre, si dos productos tuvieran
#   el mismo nombre sería confuso cual elegir, tal vez se pueda mirar la descripción, pero aún así, esto ya evita
#   problemas.
# - El nombre y precio son criticos por eso son not null, la descripción es opcional.