class CreateStatusupdates < ActiveRecord::Migration
  def change
    create_table :statusupdates do |t|
      t.string :username
      t.text :content
      t.datetime :updatetime, default: Time.now

      t.timestamps
    end
  end
end
