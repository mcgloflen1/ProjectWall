class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :idea_id
      t.integer :user_id
      t.boolean :anonymous
      t.boolean :yes

      t.timestamps
    end
  end
end
