class CreateJoinTableJobsTrades < ActiveRecord::Migration[6.1]
  def change
    create_join_table :jobs, :trades do |t|
      t.references :jobs, null: false, foreign_key: true
      t.references :trades, null: false, foreign_key: true
    end
  end
end
