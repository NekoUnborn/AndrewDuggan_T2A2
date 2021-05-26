class CreateProfileTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_trades do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :trade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
