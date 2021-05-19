class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_reference :users, :profile, foreign_key: true
  end
end
