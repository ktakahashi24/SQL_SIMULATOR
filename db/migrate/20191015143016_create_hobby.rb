class CreateHobby < ActiveRecord::Migration[6.0]
  def change
    create_table :hobbies do |t|
      t.string :name
    end
  end
end
