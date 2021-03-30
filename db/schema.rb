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


ActiveRecord::Schema.define(version: 20210309161053) do
  
  create_table "accounts", force: :cascade do |t|
    t.integer "account_id"
    t.integer "cos_id"
    t.string "account_type"
    t.integer "account_no"
    t.integer "balance", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "amount"
    t.string "message"
    t.string "status"
    t.integer "sender_phno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "requester_id"
    t.index ["requester_id"], name: "index_requests_on_requester_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "transaction_amount"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_transactions_on_receiver_id"
    t.index ["sender_id"], name: "index_transactions_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "mother_name"
    t.string "father_name"
    t.date "dob"
    t.integer "aadhar_no"
    t.string "pan_no"
    t.string "photo"
    t.string "sign"
    t.integer "cos_id"
    t.integer "phno"
    t.string "adress"
    t.string "nationality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
