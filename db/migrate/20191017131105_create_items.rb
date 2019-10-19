class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :area_id
    end
    add_index :items, :area_id
  end
end
