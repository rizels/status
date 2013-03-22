class AddDeletedatToStatusupdate < ActiveRecord::Migration
  def change
    add_column :statusupdates, :deleted_at, :time
  end
end
