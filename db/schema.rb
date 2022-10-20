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

ActiveRecord::Schema.define(version: 2022_10_20_213512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_menu_items", id: false, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "menu_item_id"
    t.integer "quantity", limit: 2, default: 1, null: false
    t.index ["cart_id", "menu_item_id"], name: "cart_menu_items_cart_id_menu_item_id_key", unique: true
  end

  create_table "carts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.decimal "total", precision: 4, scale: 2
    t.boolean "ordered_status", default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.integer "item_price_cents"
    t.integer "total_price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "menu_items", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.decimal "price", precision: 4, scale: 2, null: false
    t.string "picture_url", limit: 255
    t.string "description", limit: 255
    t.integer "category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stripe_charge_id"
    t.string "email"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "price_cents"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "restaurant_details", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "phone", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "street_address", limit: 255, null: false
    t.string "city", limit: 255, null: false
    t.string "province", limit: 255, null: false
    t.string "postal_code", limit: 255, null: false
    t.string "website", limit: 255, null: false
    t.boolean "active", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cart_menu_items", "carts", name: "cart_menu_items_cart_id_fkey", on_delete: :cascade
  add_foreign_key "cart_menu_items", "menu_items", name: "cart_menu_items_menu_item_id_fkey", on_delete: :cascade
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "products", "categories"
end
