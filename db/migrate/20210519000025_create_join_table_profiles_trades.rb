class CreateJoinTableProfilesTrades < ActiveRecord::Migration[6.1]
  def change
    create_join_table :profiles, :trades do |t|
      t.references :profiles, null: false, foreign_key: true
      t.references :trades, null: false, foreign_key: true
    end
  end
end
