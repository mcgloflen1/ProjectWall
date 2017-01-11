class AddCreatedByToColleges < ActiveRecord::Migration[5.0]
  def change
  	add_column :colleges, :created_by, :integer
  end
end
