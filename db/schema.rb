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

ActiveRecord::Schema[7.0].define(version: 2022_11_08_075237) do
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "wallet_address", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
