class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.integer :petition_id
      t.integer :user_id
      t.text :ideatext
      t.boolean :anonymous

      t.timestamps
    end
  end
end
