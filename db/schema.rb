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

ActiveRecord::Schema.define(version: 2019_10_30_154708) do

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["category_id"], name: "index_footwears_on_category_id"
    t.index ["color_id"], name: "index_footwears_on_color_id"
    t.index ["release_country_id"], name: "index_footwears_on_release_country_id"
    t.index ["season_id"], name: "index_footwears_on_season_id"
    t.index ["size_id"], name: "index_footwears_on_size_id"
    t.index ["trademark_id"], name: "index_footwears_on_trademark_id"
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
