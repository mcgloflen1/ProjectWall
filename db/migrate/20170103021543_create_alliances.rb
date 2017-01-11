class CreateAlliances < ActiveRecord::Migration[5.0]
  def change
    create_table :alliances do |t|
      t.integer :petition_id
      t.integer :user_id
      t.boolean :anonymous
      t.text :note

      t.timestamps
    end
  end
end
