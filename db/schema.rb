# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_19_053441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "name"
  end

  create_table "item_evaluations", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.float "star"
    t.index ["item_id"], name: "index_item_evaluations_on_item_id"
    t.index ["user_id"], name: "index_item_evaluations_on_user_id"
  end

  create_table "item_images", force: :cascade do |t|
    t.integer "item_id"
    t.string "image"
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "area_id"
    t.string "genre"
    t.index ["area_id"], name: "index_items_on_area_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "hobby_id"
    t.datetime "birthday"
    t.index ["hobby_id"], name: "index_users_on_hobby_id"
  end

end
