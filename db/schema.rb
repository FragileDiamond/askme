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

ActiveRecord::Schema[7.0].define(version: 20_230_130_085_020) do
  create_table 'questions', force: :cascade do |t|
    t.text 'body'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'hidden', default: false
    t.text 'answer'
    t.integer 'author_id'
    t.index ['author_id'], name: 'index_questions_on_author_id'
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'questions_tags', id: false, force: :cascade do |t|
    t.integer 'question_id'
    t.integer 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_questions_tags_on_question_id'
    t.index ['tag_id'], name: 'index_questions_tags_on_tag_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'nickname'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.string 'navbar_color', default: 'dark-red'
    t.index ['email'], name: 'index_users_on_email'
  end

  add_foreign_key 'questions', 'users', column: 'author_id'
  add_foreign_key 'questions_tags', 'questions'
  add_foreign_key 'questions_tags', 'tags'
end
