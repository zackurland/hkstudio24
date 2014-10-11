# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141010190758) do

  create_table "assets", force: true do |t|
    t.string   "type"
    t.string   "assetable_type"
    t.integer  "assetable_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "rental_start_date"
    t.integer  "rental_duration_weeks"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_index"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "dimensions"
    t.integer  "price_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "display_index"
  end

  create_table "products_tags", force: true do |t|
    t.integer "product_id"
    t.integer "tag_id"
  end

  create_table "rental_items", force: true do |t|
    t.integer  "rental_id"
    t.integer  "product_id"
    t.integer  "price_cents"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", force: true do |t|
    t.string   "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "production_name"
    t.string   "production_company"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "billing_address_2"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_country"
    t.string   "billing_zip_code"
    t.string   "designer_name"
    t.string   "designer_phone_number"
    t.string   "designer_email"
    t.string   "your_name"
    t.string   "your_phone_number"
    t.string   "your_email"
    t.boolean  "filled_out_by_designer"
  end

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "category_id"
    t.integer "display_index"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
