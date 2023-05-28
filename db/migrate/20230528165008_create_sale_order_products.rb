class CreateSaleOrderProducts < ActiveRecord::Migration
  def change
    create_table :sale_order_products do |t|
      t.integer :sale_order_id, null: false
      t.foreign_key :sale_orders

      t.integer :product_id, null: false
      t.foreign_key :products

      t.integer :quantity, null: false

      t.decimal :price, null: false

      t.timestamps
    end
  end
end

# Aclaraciones:
# - No se agrega un dependent: :delete en t.foreign_key porque no se debe borrar la venta al borrar el detalle, ni
#   borrar el producto al borrar el detalle.
# - Se guarda el precio que ya está en el producto porque el precio del producto puede cambiar y cada venta podría
#   realizarce con un precio diferente.
