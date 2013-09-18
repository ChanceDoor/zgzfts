class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :items
      t.decimal :cost
      t.datetime :ordertime
      t.integer :status
      t.string :notice
      t.string :deliverid

      t.timestamps
    end
  end
end
