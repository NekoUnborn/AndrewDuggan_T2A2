class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :business
      t.references :jobs, foreign_key: true 
      t.references :trades, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
