class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :person_id, null: false
      t.foreign_key :people, dependent: :delete

      t.timestamps
    end

    add_index :clients, :person_id, unique: true
  end
end

# Aclaraciones:
# - Se usó la gema foreigner para facilitar la agregación de claves foraneas. En Rails 4 esta utilidad viene out of box
# - Se usa dependent: :delete porque al borrar un cliente se debe borrar el registro relacionado en la tabla persona
#   porque sino, el registro de la tabla persona quedaría huerfano y sin sentido de existencia.
# - person_id debe ser not null porque no puede existir un registro de cliente sin su correspondiente registro
#   de persona, al menos no tiene sentido porque los datos del cliente están en la tabla persona.
# - Se agrega un indice único a la columna person_id, porque no debe haber más de un registro de cliente que apunte
#   a un mismo registro de persona. Además el indice en teoría mejoraría la performance de las consultas sobre esa
#   columna.