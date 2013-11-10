class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => :false, :default => '无题'
      t.datetime :posttime
      t.text :body
      t.references :editor, :null => :false, :default => ''

      t.timestamps
    end
    add_index :posts, :editor_id
    add_index :posts, :title
  end
end
