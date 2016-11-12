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

ActiveRecord::Schema.define(version: 20161112205416) do

  create_table "geo_countries", force: :cascade do |t|
    t.string "code", limit: 2
    t.index ["code"], name: "index_geo_countries_on_code", unique: true
  end

  create_table "geo_places", force: :cascade do |t|
    t.string "uid"
    t.index ["uid"], name: "index_geo_places_on_uid", unique: true
  end

end
