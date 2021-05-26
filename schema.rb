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

ActiveRecord::Schema.define(version: 2021_05_19_022650) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "unit"
    t.integer "house_number", null: false
    t.string "street", null: false
    t.string "suburb", null: false
    t.integer "postcode", null: false
    t.bigint "states_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["states_id"], name: "index_addresses_on_states_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "trades_id", null: false
    t.date "date_start"
    t.date "date_finish"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trades_id"], name: "index_jobs_on_trades_id"
  end

  create_table "jobs_trades", id: false, force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "trade_id", null: false
    t.bigint "jobs_id", null: false
    t.bigint "trades_id", null: false
    t.index ["jobs_id"], name: "index_jobs_trades_on_jobs_id"
    t.index ["trades_id"], name: "index_jobs_trades_on_trades_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "business"
    t.bigint "jobs_id"
    t.bigint "trades_id"
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_profiles_on_address_id"
    t.index ["jobs_id"], name: "index_profiles_on_jobs_id"
    t.index ["trades_id"], name: "index_profiles_on_trades_id"
  end

  create_table "profiles_trades", id: false, force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "trade_id", null: false
    t.bigint "profiles_id", null: false
    t.bigint "trades_id", null: false
    t.index ["profiles_id"], name: "index_profiles_trades_on_profiles_id"
    t.index ["trades_id"], name: "index_profiles_trades_on_trades_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.bigint "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "states", column: "states_id"
  add_foreign_key "jobs", "trades", column: "trades_id"
  add_foreign_key "jobs_trades", "jobs", column: "jobs_id"
  add_foreign_key "jobs_trades", "trades", column: "trades_id"
  add_foreign_key "profiles", "addresses"
  add_foreign_key "profiles", "jobs", column: "jobs_id"
  add_foreign_key "profiles", "trades", column: "trades_id"
  add_foreign_key "profiles_trades", "profiles", column: "profiles_id"
  add_foreign_key "profiles_trades", "trades", column: "trades_id"
  add_foreign_key "users", "profiles"
end
