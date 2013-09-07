class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.datetime :posttime
      t.string :body
      t.string :cover
      t.references :admin

      t.timestamps
    end
    add_index :books, :admin_id
  end
end
