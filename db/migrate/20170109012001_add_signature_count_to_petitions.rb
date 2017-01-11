class AddSignatureCountToPetitions < ActiveRecord::Migration[5.0]
  def change
  	add_column :petitions, :signatures_count, :integer, :default => 0
  end
end