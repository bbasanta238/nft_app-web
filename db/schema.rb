# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_07_101940) do
  create_table "list_tokens", force: :cascade do |t|
    t.integer "token_id"
    t.float "list_price"
    t.boolean "is_listed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "approval_signature"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "token_id"
    t.string "token_uri"
    t.string "name"
    t.string "description"
    t.string "image_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
  end

end
