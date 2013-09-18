class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :items
      t.decimal :cost

      t.timestamps
    end
  end
end
