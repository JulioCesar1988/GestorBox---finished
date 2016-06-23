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

ActiveRecord::Schema.define(version: 20160607172658) do

  create_table "boxes", force: :cascade do |t|
    t.text     "descripcion", limit: 65535
    t.integer  "sector_id",   limit: 4
    t.integer  "category_id", limit: 4
    t.string   "codigo",      limit: 255
    t.string   "ubicacion",   limit: 255
    t.string   "precinto_A",  limit: 255
    t.string   "precinto_B",  limit: 255
    t.date     "fecha"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "boxes", ["category_id"], name: "index_boxes_on_category_id", using: :btree
  add_index "boxes", ["sector_id"], name: "index_boxes_on_sector_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "cod",        limit: 255
    t.integer  "sector_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["sector_id"], name: "index_categories_on_sector_id", using: :btree

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "box_id",      limit: 4
    t.text     "observacion", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "fecha"
  end

  add_index "histories", ["box_id"], name: "index_histories_on_box_id", using: :btree
  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "cod",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "sector_id",              limit: 4
    t.string   "role",                   limit: 255
    t.string   "nombre",                 limit: 255
    t.string   "apellido",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sector_id"], name: "index_users_on_sector_id", using: :btree

  add_foreign_key "boxes", "categories"
  add_foreign_key "boxes", "sectors"
  add_foreign_key "categories", "sectors"
  add_foreign_key "histories", "boxes"
  add_foreign_key "histories", "users"
  add_foreign_key "users", "sectors"
end
