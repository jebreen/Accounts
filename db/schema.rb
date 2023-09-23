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

ActiveRecord::Schema[7.0].define(version: 2023_09_11_231659) do
  create_table "accounts", force: :cascade do |t|
    t.integer "account_type"
    t.string "account_name"
    t.boolean "account_contra", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journal_lines", force: :cascade do |t|
    t.integer "journal_id", null: false
    t.integer "account_id", null: false
    t.integer "debit_cents"
    t.integer "credit_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_journal_lines_on_account_id"
    t.index ["journal_id"], name: "index_journal_lines_on_journal_id"
  end

  create_table "journals", force: :cascade do |t|
    t.date "journal_date"
    t.string "journal_narration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "journal_lines", "accounts"
  add_foreign_key "journal_lines", "journals"
end
