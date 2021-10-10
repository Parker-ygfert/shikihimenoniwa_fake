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

ActiveRecord::Schema.define(version: 2021_10_10_164823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exp_configs", force: :cascade do |t|
    t.integer "level"
    t.integer "exp"
    t.bigint "rank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rank_id"], name: "index_exp_configs_on_rank_id"
  end

  create_table "hime_characters", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 1
    t.integer "exp", default: 0
    t.integer "strength"
    t.bigint "species_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["species_id"], name: "index_hime_characters_on_species_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "rank_id", null: false
    t.index ["name"], name: "index_species_on_name", unique: true
    t.index ["rank_id"], name: "index_species_on_rank_id"
  end

  add_foreign_key "exp_configs", "ranks"
  add_foreign_key "hime_characters", "species"
  add_foreign_key "species", "ranks"
end
