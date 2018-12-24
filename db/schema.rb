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

ActiveRecord::Schema.define(version: 2018_12_24_080530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.date "published_on"
    t.string "publisher"
    t.datetime "decommissioned_at"
    t.text "decommissioned_reason"
    t.integer "number_of_pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books_categories", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_categories_on_book_id"
    t.index ["category_id"], name: "index_books_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "patronymic"
    t.date "born_on"
    t.text "home_address"
    t.text "work_address"
    t.string "phone"
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers_books", force: :cascade do |t|
    t.bigint "reader_id"
    t.bigint "book_id"
    t.datetime "checked_out_at"
    t.datetime "due_to_return_at"
    t.datetime "returned_at"
    t.index ["book_id"], name: "index_readers_books_on_book_id"
    t.index ["reader_id"], name: "index_readers_books_on_reader_id"
  end

  add_foreign_key "books_categories", "books"
  add_foreign_key "books_categories", "categories"
  add_foreign_key "readers_books", "books"
  add_foreign_key "readers_books", "readers"
end
