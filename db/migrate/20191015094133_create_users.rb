class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :hobby_id
      t.datetime :birthday
    end
    add_index :users, :hobby_id
  end
end
