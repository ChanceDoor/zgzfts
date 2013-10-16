class ChangeBooksColumnBodyToText < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.change :body, :text
    end
  end

  def down
    change_table :books do |t|
      t.change :body, :string
    end
  end
end
