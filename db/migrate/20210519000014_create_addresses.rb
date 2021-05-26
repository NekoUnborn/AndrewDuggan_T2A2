class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :unit
      t.integer :house_number, null: false
      t.string :street, null: false
      t.string :suburb, null: false
      t.integer :postcode, null: false
      t.references :state, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
