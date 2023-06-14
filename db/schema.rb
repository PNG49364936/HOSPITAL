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

ActiveRecord::Schema.define(version: 2023_06_13_104319) do

  create_table "chambres", force: :cascade do |t|
    t.integer "numero"
    t.text "commentaires"
    t.boolean "disponible", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "Room_number_id"
    t.integer "chambre_id"
  end

  create_table "docteur_specialites", force: :cascade do |t|
    t.integer "docteur_id", null: false
    t.integer "specialite_id", null: false
    t.index ["docteur_id"], name: "index_docteur_specialites_on_docteur_id"
    t.index ["specialite_id"], name: "index_docteur_specialites_on_specialite_id"
  end

  create_table "docteurs", force: :cascade do |t|
    t.string "nom"
    t.integer "docteur_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "specialite_id", null: false
    t.index ["specialite_id"], name: "index_docteurs_on_specialite_id"
  end

  create_table "hospitalizations", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "patient_id", null: false
    t.integer "chambre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chambre_id"], name: "index_hospitalizations_on_chambre_id"
    t.index ["patient_id"], name: "index_hospitalizations_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "nom"
    t.text "commentaires"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "chambre_id", null: false
    t.integer "specialite_id", null: false
    t.string "specialite"
    t.integer "docteur_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["chambre_id"], name: "index_patients_on_chambre_id"
    t.index ["docteur_id"], name: "index_patients_on_docteur_id"
    t.index ["specialite_id"], name: "index_patients_on_specialite_id"
  end

  create_table "room_numbers", force: :cascade do |t|
    t.integer "numero"
    t.integer "chambre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chambre_id"], name: "index_room_numbers_on_chambre_id"
  end

  create_table "specialites", force: :cascade do |t|
    t.string "specialite"
    t.integer "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "docteur_id"
    t.index ["docteur_id"], name: "index_specialites_on_docteur_id"
  end

  create_table "specialites_and_add_foreign_key_to_docteurs", force: :cascade do |t|
  end

  add_foreign_key "docteurs", "specialites"
  add_foreign_key "hospitalizations", "chambres"
  add_foreign_key "hospitalizations", "patients"
  add_foreign_key "patients", "chambres"
  add_foreign_key "patients", "docteurs"
  add_foreign_key "patients", "specialites"
  add_foreign_key "room_numbers", "chambres"
  add_foreign_key "room_numbers", "chambres"
  add_foreign_key "specialites", "docteurs"
end
