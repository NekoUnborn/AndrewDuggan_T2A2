class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :unit
      t.integer :house_number
      t.string :street
      t.string :suburb
      t.integer :postcode
      t.references :states, null: false, foreign_key: true

      t.timestamps
    end
  end
end
