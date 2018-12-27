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

ActiveRecord::Schema.define(version: 2018_12_27_161516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "amount", null: false
    t.string "currency", null: false
    t.string "end_to_end_reference"
    t.string "numeric_reference"
    t.string "payment_id"
    t.string "payment_purpose"
    t.string "payment_scheme"
    t.string "payment_type"
    t.string "processing_date"
    t.string "reference"
    t.string "scheme_payment_type"
    t.string "scheme_payment_sub_type"
    t.jsonb "beneficiary_party"
    t.jsonb "debtor_party"
    t.jsonb "sponsor_party"
    t.jsonb "charges_information"
    t.jsonb "fx"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "version"
    t.string "organisation_id"
  end

end
