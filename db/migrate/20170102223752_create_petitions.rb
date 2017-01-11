class CreatePetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :petitions do |t|
      t.integer :college_id
      t.integer :user_id
      t.string :headline
      t.text :description
      t.string :recipient
      t.string :recipient_email
      t.integer :goal
      t.boolean :anonymous

      t.timestamps
    end
  end
end
