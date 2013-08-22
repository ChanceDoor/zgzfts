class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :title
      t.datetime :posttime
      t.text :body
      t.references :admin

      t.timestamps
    end
    add_index :distributions, :admin_id
  end
end
