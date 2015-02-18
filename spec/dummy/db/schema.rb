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

ActiveRecord::Schema.define(version: 20150218111922) do

  create_table "addresses", force: true do |t|
    t.string   "label"
    t.string   "street"
    t.string   "street2"
    t.string   "street3"
    t.string   "number"
    t.string   "care_of"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "has_address_type"
    t.integer  "has_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_infos", force: true do |t|
    t.string  "phone"
    t.string  "phone2"
    t.string  "phone3"
    t.string  "main_email"
    t.string  "billing_email"
    t.string  "website_url"
    t.integer "has_contact_info_id"
    t.string  "has_contact_info_type"
  end

  create_table "dispensaries", force: true do |t|
    t.string  "name"
    t.string  "logo_url"
    t.text    "description"
    t.string  "cover_photo_url"
    t.text    "photo_urls"
    t.string  "tag_line"
    t.string  "tag_line_blurb"
    t.text    "details_data"
    t.text    "menu_data"
    t.string  "leafly_slug"
    t.boolean "atm"
    t.boolean "credit"
    t.boolean "veterans_discount"
    t.boolean "store_front"
    t.boolean "ada"
    t.boolean "delivery"
    t.boolean "retail"
    t.boolean "medical"
    t.text    "hours"
  end

  create_table "dispensary_menus", force: true do |t|
    t.integer  "dispensary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dispensary_products", force: true do |t|
    t.string  "source"
    t.string  "name"
    t.text    "description"
    t.string  "product_type"
    t.string  "source_image_path"
    t.text    "pricing_array"
    t.string  "slug"
    t.string  "rating"
    t.string  "rating_count"
    t.string  "category"
    t.integer "dispensary_menu_id"
  end

  create_table "leafly_connections", force: true do |t|
    t.string   "app_id"
    t.string   "app_key"
    t.string   "app_name"
    t.string   "leafly_connectable_type"
    t.integer  "leafly_connectable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_networking_profiles", force: true do |t|
    t.string   "facebook_app_id"
    t.string   "facebook_app_secret"
    t.string   "facebook_id"
    t.string   "twitter_app_id"
    t.string   "twitter_id"
    t.string   "has_social_networking_id"
    t.string   "has_social_networking_type"
    t.string   "tumbr_id"
    t.string   "google_plus_id"
    t.string   "pinterest_id"
    t.string   "instagram_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.integer  "leafly_connection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
