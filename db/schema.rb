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

ActiveRecord::Schema.define(version: 20150128045200) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "profile"
    t.string   "city"
    t.integer  "owner_id"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "tumblr"
    t.string   "home_page"
    t.boolean  "active"
    t.string   "founders"
    t.string   "logo"
    t.string   "original_filename"
    t.string   "vid_vimeo"
    t.string   "vid_youtube"
    t.string   "main_contact"
    t.text     "current_notes"
    t.string   "state"
    t.integer  "zip"
    t.string   "street"
    t.string   "untappd"
    t.string   "ratebeer"
    t.string   "beeradvocate"
  end

  add_index "brands", ["owner_id"], name: "index_brands_on_owner_id"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "products", force: true do |t|
    t.text     "tasting_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "price"
    t.string   "status"
    t.integer  "brand_id"
    t.integer  "owner_id"
    t.boolean  "active"
    t.boolean  "archived"
    t.text     "abv"
    t.boolean  "usa"
    t.string   "primary_image"
    t.string   "original_filename"
    t.boolean  "limited"
    t.boolean  "existingline"
    t.string   "existingurl"
    t.string   "ibu"
    t.text     "grain_bill"
    t.string   "style"
    t.text     "hops"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["owner_id"], name: "index_products_on_owner_id"

  create_table "remote_data", force: true do |t|
    t.integer  "product_id"
    t.string   "slug"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remote_data", ["product_id"], name: "index_remote_data_on_product_id"

  create_table "secondary_images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "original_filename"
  end

  add_index "secondary_images", ["imageable_id", "imageable_type"], name: "index_secondary_images_on_imageable_id_and_imageable_type"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
