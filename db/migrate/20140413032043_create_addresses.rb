class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :fname
      t.string :lname
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.string :phone
      t.integer :card_id

      t.timestamps
    end
  end
end
