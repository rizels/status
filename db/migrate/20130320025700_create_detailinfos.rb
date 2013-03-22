class CreateDetailinfos < ActiveRecord::Migration
  def change
    create_table :detailinfos do |t|
      t.integer :info_id
      t.text :content

      t.timestamps
    end
  end
end
