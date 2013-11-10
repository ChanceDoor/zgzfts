class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :name, :null => false, :default => '未命名'
      t.string :portrait
      t.string :level, :null => false, :default => '实习编辑'
      t.text :resume
      t.timestamps
    end

    add_index :editors, :name, :unique => true
  end
end
