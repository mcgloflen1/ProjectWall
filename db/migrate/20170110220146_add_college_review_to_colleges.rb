class AddCollegeReviewToColleges < ActiveRecord::Migration[5.0]
  def change
  	add_column :colleges, :college_approval, :boolean, :default => false
  end
end
