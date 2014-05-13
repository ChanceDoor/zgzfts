class RebuildOrders < ActiveRecord::Migration
  def change
    if table_exists? :orders
      drop_table :orders
    end
    create_table :orders do |t|
      t.string :product_type
      t.string :phone
      t.string :name
      t.string :email
      t.string :qq

      t.timestamps
    end
  end
end
