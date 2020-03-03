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

ActiveRecord::Schema.define(version: 2020_03_03_105604) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer "dni", limit: 8
    t.string "fullname"
    t.string "mail"
    t.string "telephone"
    t.string "address"
    t.boolean "avanzar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount_old", precision: 8, scale: 2
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "footwears", force: :cascade do |t|
    t.string "sku"
    t.integer "trademark_id"
    t.integer "category_id"
    t.integer "color_id"
    t.integer "stock"
    t.integer "stock_warning"
    t.decimal "wholesale_price", precision: 8, scale: 2
    t.decimal "retail_price", precision: 8, scale: 2
    t.string "gender"
    t.boolean "active"
    t.string "short_description"
    t.string "long_description"
    t.date "release_date"
    t.string "sex"
    t.integer "release_country_id"
    t.integer "size_id"
    t.string "weight"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "article"
    t.index ["category_id"], name: "index_footwears_on_category_id"
    t.index ["color_id"], name: "index_footwears_on_color_id"
    t.index ["release_country_id"], name: "index_footwears_on_release_country_id"
    t.index ["season_id"], name: "index_footwears_on_season_id"
    t.index ["size_id"], name: "index_footwears_on_size_id"
    t.index ["trademark_id"], name: "index_footwears_on_trademark_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "way_pay_id"
    t.integer "fee"
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "real_amount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_payment_details_on_payment_id"
    t.index ["way_pay_id"], name: "index_payment_details_on_way_pay_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "payment_date"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.integer "cuil", limit: 8
    t.string "telephone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_countries", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "footwear_id"
    t.integer "count"
    t.decimal "real_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["footwear_id"], name: "index_sale_details_on_footwear_id"
    t.index ["sale_id"], name: "index_sale_details_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.date "date_sale"
    t.integer "client_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "number"
    t.decimal "us"
    t.decimal "cms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trademarks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_trademarks_on_provider_id"
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

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "way_pays", force: :cascade do |t|
    t.string "name"
    t.float "c1"
    t.float "c2"
    t.float "c3"
    t.float "c4"
    t.float "c5"
    t.float "c6"
    t.float "c7"
    t.float "c8"
    t.float "c9"
    t.float "c10"
    t.float "c11"
    t.float "c12"
    t.float "c13"
    t.float "c14"
    t.float "c15"
    t.float "c16"
    t.float "c17"
    t.float "c18"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
