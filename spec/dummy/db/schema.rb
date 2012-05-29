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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120526211015) do

  create_table "iso639_config_langs", :force => true do |t|
    t.string   "bib_code",         :null => false
    t.boolean  "display"
    t.string   "script_direction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "iso639_config_langs", ["bib_code"], :name => "index_iso639_config_langs_on_bib_code"
  add_index "iso639_config_langs", ["display"], :name => "index_iso639_config_langs_on_display"

  create_table "manuscripts", :force => true do |t|
    t.string   "name"
    t.string   "main_lang_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manuscripts", ["main_lang_id"], :name => "index_manuscripts_on_main_lang_id"

  create_table "other_langs", :force => true do |t|
    t.integer  "manuscript_id"
    t.integer  "lang_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "other_langs", ["lang_id"], :name => "index_other_langs_on_lang_id"
  add_index "other_langs", ["manuscript_id"], :name => "index_other_langs_on_manuscript_id"

end
