class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :total_price
      t.integer :payment
      t.integer :order_status
      t.string :order_name
      t.text :order_address
      t.integer :order_postal_code

      t.timestamps
    end
  end
end
