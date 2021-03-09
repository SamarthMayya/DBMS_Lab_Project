ActiveRecord::Schema.define(version: 20210307094448) do

  create_table "accounts", force: :cascade do |t|
    t.integer "account_id"
    t.integer "cos_id"
    t.string "account_type"
    t.integer "account_no"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "sender_id"
    t.integer "amount"
    t.string "message"
    t.string "status"
    t.integer "sender_phno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
