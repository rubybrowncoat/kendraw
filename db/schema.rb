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

ActiveRecord::Schema.define(version: 20180222075323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "saved_boards", force: :cascade do |t|
    t.text "content"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shared_actives", force: :cascade do |t|
    t.bigint "shared_board_id"
    t.integer "top"
    t.integer "left"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shared_board_id", "top", "left"], name: "index_shared_actives_on_shared_board_id_and_top_and_left", unique: true
    t.index ["shared_board_id"], name: "index_shared_actives_on_shared_board_id"
  end

  create_table "shared_boards", force: :cascade do |t|
    t.text "content"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shared_actives", "shared_boards"
end
