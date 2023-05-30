class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, limit: 100, null: false
      t.string :last_name, limit: 100, null: false
      t.string :document_number, limit: 100
      t.string :address, limit: 150
      t.string :phone, limit: 50

      t.integer :client_id
      t.foreign_key :clients, dependent: :delete

      t.integer :user_id
      t.foreign_key :users, dependent: :delete

      t.timestamps
    end

    add_index :people, :document_number, unique: true
    # Se usa un índice único para que estos ids no se repitan en un mismo registro
    add_index :people, [:client_id, :user_id], unique: true
    # Los campos client_id y user_id no pueden ser ambos nulos, se debe setear uno u otro o ambos, porque no tiene sentido tener una persona que no sea cliente y/o usuario
    # El orden es importante, validate_required_client_id_or_user_id debe saltar antes que validate_not_nullable_client_attributes
    execute"alter table people add constraint validate_require_client_id_or_user_id CHECK (client_id is not null or user_id is not null)"
    # La persona es un cliente cuando client_id está seteado, cuando la persona es un cliente, document_number, address y phone son obligatorios.
    execute"alter table people add constraint validate_require_doc_num_and_addr_and_phone_client_attributes CHECK (not ((document_number is null or address is null or phone is null) and client_id is not null))"
  end
end

# Aclaraciones:
# Sobre foreign_key
# - Se usó la gema foreigner para facilitar la agregación de claves foraneas. En Rails 4 esta utilidad viene out of box
# - Se usa dependent: :delete porque al borrar un registro, ej. un person, se debe borrar el registro relacionado en la tabla clients
#   porque sino, el registro de la tabla clients quedaría huerfano y sin sentido de existencia.
#
# Otros
# - Se agrega un índice único a document_number porque es un dato que no debería repetirse, al menos en un mismo país.
#   Además mejoraría la performance de las consultas sobre esa columna.
# - Los campos not null son datos considerados importantes y/o críticos para las operaciones de la aplicación.
# - La tabla people también puede usarse para registrar datos de un usuario del sistema como su nombre y apellido
#   , pero en este caso datos como document_number, address y phone no son criticos pero si son
#   críticos para un cliente, entonces se agrega un constraint para validar que esos atributos no sean null cuando
#   el person es cliente
