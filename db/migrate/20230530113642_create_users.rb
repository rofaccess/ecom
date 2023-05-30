class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, length: 50, null: false
      t.string :email, length: 100, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end

# Aclaraciones
# - nombre y correo deben ser unicos porque se suelen usar como identificadores del usuario.
