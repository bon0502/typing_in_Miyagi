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

ActiveRecord::Schema[7.2].define(version: 2026_08_06_121429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typing_answers", force: :cascade do |t|
    t.bigint "typing_question_id", null: false
    t.string "answer_text", null: false
    t.boolean "is_primary", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typing_question_id"], name: "index_typing_answers_on_typing_question_id"
  end

  create_table "typing_questions", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "question_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "meaning"
    t.string "answer"
    t.index ["course_id"], name: "index_typing_questions_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "nickname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "typing_answers", "typing_questions"
  add_foreign_key "typing_questions", "courses"
end
