class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.datetime :posttime
      t.text :body
      t.references :admin

      t.timestamps
    end
    add_index :notices, :admin_id
  end
end
