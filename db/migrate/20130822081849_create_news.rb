class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.datetime :posttime
      t.text :body
      t.references :admin

      t.timestamps
    end
    add_index :news, :admin_id
  end
end
