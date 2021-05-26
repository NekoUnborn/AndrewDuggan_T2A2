class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.references :profile, null: false, foreign_key: true
      t.date :date_start
      t.date :date_finish
      t.boolean :completed

      t.timestamps
    end
  end
end
