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

ActiveRecord::Schema[7.0].define(version: 2022_07_01_223006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "nickname"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "calendar_users", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "time"
    t.bigint "customer_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_calendar_users_on_customer_id"
    t.index ["employee_id"], name: "index_calendar_users_on_employee_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.decimal "price_col_complete"
    t.decimal "price_col_half"
    t.decimal "price_spain"
    t.bigint "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "region"
    t.string "body"
    t.index ["sector_id"], name: "index_categories_on_sector_id"
  end

  create_table "cupon_users", force: :cascade do |t|
    t.bigint "cupon_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cupon_id"], name: "index_cupon_users_on_cupon_id"
    t.index ["customer_id"], name: "index_cupon_users_on_customer_id"
  end

  create_table "cupons", force: :cascade do |t|
    t.string "name"
    t.integer "discount"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cupon_title"
  end

  create_table "customer_notifications", force: :cascade do |t|
    t.string "name"
    t.string "body"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_notifications_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "client_type"
    t.date "birth_date"
    t.string "region"
    t.string "cod_refer"
    t.bigint "user_id", null: false
    t.string "country"
    t.string "document_type"
    t.string "document_id"
    t.boolean "new", default: true
    t.boolean "boolean", default: true
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encargado"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "employee_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_employee_categories_on_category_id"
    t.index ["employee_id"], name: "index_employee_categories_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.string "country"
    t.date "birth_date"
    t.string "region"
    t.string "document_id"
    t.string "document_type"
    t.string "contact"
    t.string "experience"
    t.bigint "user_id", null: false
    t.boolean "new", default: true
    t.boolean "boolean", default: true
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "biografy"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "employee_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["employee_category_id"], name: "index_favorites_on_employee_category_id"
  end

  create_table "habilities", force: :cascade do |t|
    t.string "hability"
    t.string "body"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hability_employees", force: :cascade do |t|
    t.bigint "hability_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_hability_employees_on_employee_id"
    t.index ["hability_id"], name: "index_hability_employees_on_hability_id"
  end

  create_table "newslatters", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "name"
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.string "address"
    t.date "start_date"
    t.date "finish_date"
    t.string "service_time"
    t.string "discount"
    t.string "workday"
    t.string "supply_food"
    t.boolean "active", default: true
    t.bigint "category_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hours"
    t.index ["category_id"], name: "index_order_details_on_category_id"
    t.index ["customer_id"], name: "index_order_details_on_customer_id"
    t.index ["employee_id"], name: "index_order_details_on_employee_id"
  end

  create_table "practice_employees", force: :cascade do |t|
    t.bigint "practice_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_practice_employees_on_employee_id"
    t.index ["practice_id"], name: "index_practice_employees_on_practice_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.string "body"
    t.bigint "employee_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reports_on_customer_id"
    t.index ["employee_id"], name: "index_reports_on_employee_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "score"
    t.bigint "customer_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["employee_id"], name: "index_reviews_on_employee_id"
  end

  create_table "sector_cats", force: :cascade do |t|
    t.bigint "sector_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sector_cats_on_category_id"
    t.index ["sector_id"], name: "index_sector_cats_on_sector_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.string "token"
    t.integer "authy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "social_id"
    t.string "lada"
    t.index ["token"], name: "index_users_on_token", unique: true
    t.index ["user_type", "email"], name: "index_users_on_user_type_and_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "customers"
  add_foreign_key "admins", "users"
  add_foreign_key "calendar_users", "customers"
  add_foreign_key "calendar_users", "employees"
  add_foreign_key "categories", "sectors"
  add_foreign_key "cupon_users", "cupons"
  add_foreign_key "cupon_users", "customers"
  add_foreign_key "customer_notifications", "customers"
  add_foreign_key "customers", "users"
  add_foreign_key "employee_categories", "categories"
  add_foreign_key "employee_categories", "employees"
  add_foreign_key "employees", "users"
  add_foreign_key "favorites", "customers"
  add_foreign_key "favorites", "employee_categories"
  add_foreign_key "hability_employees", "employees"
  add_foreign_key "hability_employees", "habilities"
  add_foreign_key "notifications", "users"
  add_foreign_key "order_details", "categories"
  add_foreign_key "order_details", "customers"
  add_foreign_key "order_details", "employees"
  add_foreign_key "practice_employees", "employees"
  add_foreign_key "practice_employees", "practices"
  add_foreign_key "reports", "customers"
  add_foreign_key "reports", "employees"
  add_foreign_key "reviews", "customers"
  add_foreign_key "reviews", "employees"
  add_foreign_key "sector_cats", "categories"
  add_foreign_key "sector_cats", "sectors"
  add_foreign_key "services", "categories"
end
