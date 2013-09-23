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

ActiveRecord::Schema.define(version: 20130923102329) do

  create_table "products", force: true do |t|
    t.string   "name_ru"
    t.string   "product_code"
    t.float    "weight"
    t.decimal  "price",               precision: 8, scale: 2
    t.decimal  "list_price",          precision: 8, scale: 2
    t.string   "slug"
    t.text     "description_ru"
    t.text     "meta_description_ru"
    t.text     "meta_title_ru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
