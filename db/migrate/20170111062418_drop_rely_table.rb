class DropRelyTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :replies
  end
end
