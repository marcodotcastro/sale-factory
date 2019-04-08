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

ActiveRecord::Schema.define(version: 2019_04_08_161926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cidades", force: :cascade do |t|
    t.string "descricao"
    t.string "estado"
    t.integer "populacao"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "descricao"
    t.string "contato"
    t.string "endereco"
    t.string "cep"
    t.string "telefone"
    t.string "setor"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cidade_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["cidade_id"], name: "index_clientes_on_cidade_id"
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "lojistas", force: :cascade do |t|
    t.string "descricao"
    t.string "endereco"
    t.string "telefone"
    t.string "cep"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cidade_id"
    t.bigint "representante_comercial_id"
    t.index ["cidade_id"], name: "index_lojistas_on_cidade_id"
    t.index ["representante_comercial_id"], name: "index_lojistas_on_representante_comercial_id"
  end

  create_table "representante_comerciais", force: :cascade do |t|
    t.string "descricao"
    t.string "contato"
    t.string "endereco"
    t.string "cep"
    t.string "telefone"
    t.string "email"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cidade_id"
    t.bigint "cliente_id"
    t.index ["cidade_id"], name: "index_representante_comerciais_on_cidade_id"
    t.index ["cliente_id"], name: "index_representante_comerciais_on_cliente_id"
  end

  add_foreign_key "clientes", "cidades"
  add_foreign_key "lojistas", "cidades"
  add_foreign_key "lojistas", "representante_comerciais"
  add_foreign_key "representante_comerciais", "cidades"
  add_foreign_key "representante_comerciais", "clientes"
end
