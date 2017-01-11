class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :association
      t.string :streetaddress
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.string :language

      t.timestamps
    end
  end
end
