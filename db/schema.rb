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

ActiveRecord::Schema.define(version: 2019_04_10_185011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.string "endereco"
    t.string "cep"
    t.string "contato"
    t.string "telefone"
    t.string "telefone_whatsapp"
    t.string "email"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cidade_id"
    t.bigint "usuario_id"
    t.bigint "setor_id"
    t.index ["cidade_id"], name: "index_clientes_on_cidade_id"
    t.index ["setor_id"], name: "index_clientes_on_setor_id"
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
  end

  create_table "lojistas", force: :cascade do |t|
    t.string "descricao"
    t.string "endereco"
    t.string "cep"
    t.string "contato"
    t.string "telefone"
    t.string "telefone_whatsapp"
    t.string "email"
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
    t.string "endereco"
    t.string "cep"
    t.string "contato"
    t.string "telefone"
    t.string "telefone_whatsapp"
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

  create_table "setores", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["invitation_token"], name: "index_usuarios_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_usuarios_on_invitations_count"
    t.index ["invited_by_id"], name: "index_usuarios_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_usuarios_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clientes", "cidades"
  add_foreign_key "clientes", "setores"
  add_foreign_key "clientes", "usuarios"
  add_foreign_key "lojistas", "cidades"
  add_foreign_key "lojistas", "representante_comerciais"
  add_foreign_key "representante_comerciais", "cidades"
  add_foreign_key "representante_comerciais", "clientes"
end
