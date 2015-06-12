class CreateItemInOrders < ActiveRecord::Migration
  def change
    create_table :item_in_orders do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
