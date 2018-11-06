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

ActiveRecord::Schema.define(version: 2018_11_06_194332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.bigint "user_id"
    t.string "address_complement"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string "attachinariable_type"
    t.bigint "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
    t.index ["attachinariable_type", "attachinariable_id"], name: "index_attachinary_files_attachinariable"
  end

  create_table "campaigns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.string "test_type"
    t.datetime "expiration_date"
    t.bigint "category_id"
    t.integer "views", default: 0
    t.string "title"
    t.string "slug"
    t.float "price_1"
    t.float "price_2"
    t.float "price_3"
    t.index ["category_id"], name: "index_campaigns_on_category_id"
    t.index ["product_id"], name: "index_campaigns_on_product_id"
    t.index ["slug"], name: "index_campaigns_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "leads", force: :cascade do |t|
    t.string "brand"
    t.string "email"
    t.string "phone"
    t.string "contact_person"
    t.string "referal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "picks", force: :cascade do |t|
    t.float "price"
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.string "state"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_picks_on_campaign_id"
    t.index ["user_id"], name: "index_picks_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "category_id"
    t.float "price"
    t.string "slug"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pro_id"
    t.float "price_ht"
    t.float "expedition_costs"
    t.string "video_url"
    t.string "facebook"
    t.string "instagram"
    t.string "youtube"
    t.string "twitter"
    t.string "size_guide"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["pro_id"], name: "index_products_on_pro_id"
  end

  create_table "pros", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.string "phone"
    t.string "contact_person"
    t.string "referal"
    t.string "slug"
    t.boolean "admin", default: false
    t.string "stripe_uid"
    t.index ["email"], name: "index_pros_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pros_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_pros_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.string "slug"
    t.date "date_of_birth"
    t.string "sex"
    t.string "phone"
    t.string "customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "campaigns", "categories"
  add_foreign_key "campaigns", "products"
  add_foreign_key "picks", "campaigns"
  add_foreign_key "picks", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "pros"
end
