class CreateJobTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :job_trades do |t|
      t.references :job, null: false, foreign_key: true
      t.references :trade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
