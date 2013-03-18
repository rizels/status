class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :statusupdate

      t.timestamps
    end
    add_index :comments, :statusupdate_id
  end
end
