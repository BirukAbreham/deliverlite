# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_15_035212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_activities", force: :cascade do |t|
    t.text "message", null: false
    t.bigint "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_campaign_activities_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "scheduled_at", null: false
    t.datetime "sent_at"
    t.string "campaign_type", null: false
    t.integer "total_recipients", null: false
    t.boolean "is_archived", default: false
    t.integer "open_count", default: 0
    t.float "open_rate", default: 0.0
    t.integer "click_count", default: 0
    t.float "click_rate", default: 0.0
    t.integer "bounce_count", default: 0
    t.float "bounce_rate", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_activities", force: :cascade do |t|
    t.text "message", null: false
    t.string "activity_type", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_contact_activities_on_contact_id"
  end

  create_table "contact_custom_fields", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "contact_id", null: false
    t.bigint "custom_field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_contact_custom_fields_on_contact_id"
    t.index ["custom_field_id"], name: "index_contact_custom_fields_on_custom_field_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "sent", default: 0
    t.integer "open", default: 0
    t.integer "delivered", default: 0
    t.integer "clicked", default: 0
    t.string "contact_type", null: false
    t.datetime "date_subscribed"
    t.datetime "date_unsubscribed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total", default: 0
    t.integer "active", default: 0
    t.integer "unsubscribed", default: 0
    t.integer "bounced", default: 0
    t.integer "junk", default: 0
    t.integer "sent", default: 0
    t.integer "opened", default: 0
    t.integer "clicked", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "segment_rule_custom_fields", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "segment_rule_id", null: false
    t.bigint "custom_field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["custom_field_id"], name: "index_segment_rule_custom_fields_on_custom_field_id"
    t.index ["segment_rule_id"], name: "index_segment_rule_custom_fields_on_segment_rule_id"
  end

  create_table "segment_rules", force: :cascade do |t|
    t.string "operator", null: false
    t.text "arguments", null: false
    t.bigint "segment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["segment_id"], name: "index_segment_rules_on_segment_id"
  end

  create_table "segments", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "campaign_activities", "campaigns"
  add_foreign_key "contact_activities", "contacts"
  add_foreign_key "contact_custom_fields", "contacts"
  add_foreign_key "contact_custom_fields", "custom_fields"
  add_foreign_key "segment_rule_custom_fields", "custom_fields"
  add_foreign_key "segment_rule_custom_fields", "segment_rules"
  add_foreign_key "segment_rules", "segments"
end
