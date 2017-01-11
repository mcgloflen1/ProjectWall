class FixUserAssociation < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :association, :associated_with
  end
end
