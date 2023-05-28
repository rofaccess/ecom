class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, limit: 100, null: false
      t.string :last_name, limit: 100, null: false
      t.string :document_number, limit: 100, null: false
      t.string :address, limit: 150, null: false
      t.string :phone, limit: 50, null: false

      t.timestamps
    end

    add_index :people, :document_number, unique: true
  end
end

# Aclaraciones:
# - Se agrega un índice único a document_number porque es un dato que no debería repetirse, al menos en un mismo país.
#   Además mejoraría la performance de las consultas sobre esa columna.
# - Todos los campos son not null porque son datos considerados importantes y/o críticos para las operaciones de la
#   aplicación.