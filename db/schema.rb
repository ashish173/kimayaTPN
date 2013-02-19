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

ActiveRecord::Schema.define(:version => 20130219063328) do

  create_table "admissions", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.date     "admitted_on"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "hospital_id"
  end

  create_table "anthropometric_measurements", :force => true do |t|
    t.integer  "investigation_id"
    t.float    "weight"
    t.float    "head_circ"
    t.float    "length"
    t.date     "weight_measured_date"
    t.date     "head_circ_measured_date"
    t.date     "length_measured_date"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "biochemistry_assessments", :force => true do |t|
    t.integer  "investigation_id"
    t.string   "serum_urea"
    t.string   "serum_creatinine"
    t.string   "triglycerides"
    t.string   "urine_area"
    t.string   "bilirubin"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "blood_analyses", :force => true do |t|
    t.integer  "investigation_id"
    t.string   "ph"
    t.string   "pco2"
    t.string   "pao2"
    t.string   "hco3"
    t.string   "abe"
    t.string   "so2"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "blood_sugar_monitors", :force => true do |t|
    t.integer  "investigation_id"
    t.time     "blood_sugar_monitored_on"
    t.string   "details"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "diagnoses", :force => true do |t|
    t.integer  "investigation_id"
    t.boolean  "hypoglycemia"
    t.string   "hypoglycemia_episode"
    t.boolean  "hyperglycemia"
    t.string   "hyperglycemia_episode"
    t.string   "sepsis"
    t.boolean  "exhange"
    t.boolean  "thrombocytopenia"
    t.string   "dol"
    t.boolean  "haemorrhage"
    t.string   "grade"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "hospital_id"
  end

  create_table "electrolytes", :force => true do |t|
    t.integer  "investigation_id"
    t.string   "sodium"
    t.string   "potassium"
    t.string   "calcium"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "enteral_diagnoses", :force => true do |t|
    t.integer  "investigation_id"
    t.boolean  "ebm"
    t.boolean  "formula_feeds"
    t.string   "enteral_nutrition"
    t.string   "total_enteral_calories"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "genders", :force => true do |t|
    t.string "name"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.integer  "doctors_count"
    t.integer  "nutritionists_count"
    t.integer  "patients_count"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "investigations", :force => true do |t|
    t.integer  "patient_id"
    t.date     "investigated_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "hospital_id"
  end

  create_table "mother_histories", :force => true do |t|
    t.integer  "patient_id"
    t.boolean  "is_anc"
    t.float    "g"
    t.float    "p"
    t.float    "a"
    t.string   "maternal_usg"
    t.string   "age"
    t.string   "pre_pregnancy_weight"
    t.string   "height"
    t.string   "toxemia"
    t.string   "diabetes"
    t.string   "is_antenatal_steroids"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "medical_history"
    t.text     "other_medical_problems"
    t.integer  "hospital_id"
  end

  create_table "patient_histories", :force => true do |t|
    t.integer  "patient_id"
    t.string   "gestational_age"
    t.string   "gender_details"
    t.string   "ga"
    t.string   "mode_of_delivery"
    t.string   "rupture_of_membranes"
    t.string   "apgar_score_1"
    t.string   "apgar_score_5"
    t.string   "apgar_score_20"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "hospital_id"
  end

  create_table "patients", :force => true do |t|
    t.string   "gender_id"
    t.string   "name"
    t.string   "registration_number"
    t.date     "date_of_birth"
    t.float    "birth_weight"
    t.string   "address"
    t.string   "city"
    t.string   "pincode"
    t.string   "state"
    t.string   "residence_telephone"
    t.string   "emergency_telephone"
    t.string   "mobile_number"
    t.string   "additional_detail"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "hospital_id"
  end

  add_index "patients", ["gender_id"], :name => "index_patients_on_gender_id"
  add_index "patients", ["registration_number"], :name => "index_patients_on_registration_number"

  create_table "reports", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "hospital_id"
  end

  create_table "tpn_additives", :force => true do |t|
    t.integer  "investigation_id"
    t.integer  "day_of_life"
    t.integer  "day_of_tpn"
    t.float    "fluid_intake"
    t.float    "enteral_feeds"
    t.float    "tpn_volume"
    t.float    "amino_acids"
    t.float    "lipids"
    t.float    "tpn_calories"
    t.float    "dir"
    t.float    "ner"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "hospital_id"
  end

  create_table "tpn_market_additives", :force => true do |t|
    t.string   "name"
    t.string   "market_name"
    t.float    "constant"
    t.string   "unit"
    t.float    "max_value"
    t.float    "min_value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tpns", :force => true do |t|
    t.integer  "patient_id"
    t.float    "current_weight"
    t.integer  "day_of_tpn"
    t.float    "dextrose_conc"
    t.string   "administration"
    t.float    "total_fluid_intake"
    t.float    "feed_volume"
    t.float    "fat_volume"
    t.float    "fat_concentration"
    t.float    "factor"
    t.float    "losses"
    t.float    "amino_acid"
    t.float    "sodium_chloride"
    t.float    "potassium_chloride"
    t.float    "calcium"
    t.float    "magnesium"
    t.float    "mvi"
    t.integer  "amino_acid_additive_id"
    t.integer  "sodium_chloride_additive_id"
    t.integer  "potassium_chloride_additive_id"
    t.integer  "calcium_additive_id"
    t.integer  "magnesium_additive_id"
    t.float    "heparin"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "hospital_id"
    t.integer  "user_id"
    t.date     "tpn_date"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "pincode"
    t.string   "residence_telephone"
    t.string   "emergency_telephone"
    t.string   "mobile_number"
    t.string   "additional_detail"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "hospital_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
