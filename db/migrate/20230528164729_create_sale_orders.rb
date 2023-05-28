class CreateSaleOrders < ActiveRecord::Migration
  def change
    create_table :sale_orders do |t|
      t.integer :number, null: false
      t.datetime :sold_at, null: false

      t.integer :client_id, null: false
      t.foreign_key :clients

      t.timestamps
    end
  end
end

# Aclaraciones:
# - No se agrega un dependent: :delete en t.foreign_key porque no se debe borrar el cliente al borrar la venta
