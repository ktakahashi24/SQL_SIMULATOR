class CreateItemImages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_images do |t|
      t.integer :item_id
      t.string :image
    end
    add_index :item_images, :item_id
  end
end
