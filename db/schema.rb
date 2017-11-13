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

ActiveRecord::Schema.define(version: 20171113162834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "multi_choice_questions", force: :cascade do |t|
    t.bigint "survey_id"
    t.string "body"
    t.boolean "required", default: true
    t.boolean "multipart", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_multi_choice_questions_on_survey_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "multi_choice_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "picked_count", default: 0, null: false
    t.index ["multi_choice_question_id"], name: "index_question_options_on_multi_choice_question_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "multi_choice_questions", "surveys"
  add_foreign_key "question_options", "multi_choice_questions"
end
