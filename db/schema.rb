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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150430002315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "industries", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", force: true do |t|
    t.string   "investors",    default: [], array: true
    t.string   "level"
    t.integer  "amount"
    t.integer  "start_ups_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investments", ["start_ups_id"], name: "index_investments_on_start_ups_id", using: :btree

  create_table "invitation_codes", force: true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "group_code",  default: false
    t.integer  "used_by_ids", default: [],    array: true
  end

  add_index "invitation_codes", ["user_id"], name: "index_invitation_codes_on_user_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.integer  "state",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.boolean  "read",         default: false
  end

  add_index "invitations", ["from_user_id"], name: "index_invitations_on_from_user_id", using: :btree
  add_index "invitations", ["to_user_id"], name: "index_invitations_on_to_user_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.boolean  "projector",  default: false
    t.integer  "fit_types",  default: [],    array: true
    t.string   "pictures",   default: [],    array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remarks", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "supporters", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  add_index "remarks", ["user_id"], name: "index_remarks_on_user_id", using: :btree

  create_table "start_ups", force: true do |t|
    t.string   "logo_url"
    t.string   "name"
    t.integer  "likes_count", default: 0
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.integer  "user_id"
    t.integer  "like_ids",    default: [], array: true
    t.string   "weibo"
    t.string   "from_url"
  end

  create_table "topic_comments", force: true do |t|
    t.text     "content"
    t.integer  "level",      default: 0
    t.integer  "parent_id"
    t.integer  "up_count",   default: 0
    t.integer  "supporters", default: [], array: true
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "topics", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "supporters",           default: [],    array: true
    t.integer  "up_count",             default: 0
    t.integer  "wanna_join_users",     default: [],    array: true
    t.integer  "topic_comments_count", default: 0
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "attendee_number",      default: 10
    t.string   "tags",                 default: [],    array: true
    t.boolean  "personal",             default: false
    t.string   "organizer"
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "skill"
    t.text     "desc"
    t.string   "corp"
    t.string   "position"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "public_email",           default: true
    t.string   "avatar"
    t.integer  "industry_id"
    t.integer  "registration_state",     default: 0
    t.string   "qq_number"
    t.string   "weixin_number"
    t.string   "phone_number"
    t.integer  "friend_ids",             default: [],                array: true
    t.string   "roles",                  default: [],                array: true
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weixin_accounts", force: true do |t|
    t.integer  "user_id"
    t.boolean  "following",  default: true
    t.string   "open_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.integer  "sex"
    t.string   "language"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "headimgurl"
  end

  add_index "weixin_accounts", ["user_id"], name: "index_weixin_accounts_on_user_id", using: :btree

end
