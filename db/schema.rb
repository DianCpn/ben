# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_141619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packagings", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_packages", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "packaging_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["packaging_id"], name: "index_product_packages_on_packaging_id"
    t.index ["product_id"], name: "index_product_packages_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "brand"
    t.string "title"
    t.string "upc"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_searches_on_product_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "product_packages", "packagings"
  add_foreign_key "product_packages", "products"
  add_foreign_key "searches", "products"
  add_foreign_key "searches", "users"
end
