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
