class CreateItemEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :item_evaluations do |t|
      t.integer :item_id
      t.integer :user_id
      t.float :star
    end
    add_index :item_evaluations, :item_id
    add_index :item_evaluations, :user_id
  end
end
