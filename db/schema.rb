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

ActiveRecord::Schema.define(version: 2019_04_30_111544) do

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

  create_table "badges_sashes", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "sash_id"
    t.boolean "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id"
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id"
  end

  create_table "cidades", force: :cascade do |t|
    t.string "codigo"
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
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["cidade_id"], name: "index_clientes_on_cidade_id"
    t.index ["deleted_at"], name: "index_clientes_on_deleted_at"
    t.index ["setor_id"], name: "index_clientes_on_setor_id"
    t.index ["slug"], name: "index_clientes_on_slug", unique: true
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
  end

  create_table "clientes_lojistas", id: false, force: :cascade do |t|
    t.bigint "lojista_id"
    t.bigint "cliente_id"
    t.index ["cliente_id"], name: "index_clientes_lojistas_on_cliente_id"
    t.index ["lojista_id"], name: "index_lojistas_clientes_on_lojista_id"
  end

  create_table "clientes_representantes", id: false, force: :cascade do |t|
    t.bigint "cliente_id"
    t.bigint "representante_id"
    t.index ["cliente_id"], name: "index_clientes_representantes_on_cliente_id"
    t.index ["representante_id"], name: "index_representantes_clientes_on_representante_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
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
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["cidade_id"], name: "index_lojistas_on_cidade_id"
    t.index ["deleted_at"], name: "index_lojistas_on_deleted_at"
    t.index ["slug"], name: "index_lojistas_on_slug", unique: true
  end

  create_table "lojistas_representantes", id: false, force: :cascade do |t|
    t.bigint "representante_id"
    t.bigint "lojista_id"
    t.index ["lojista_id"], name: "index_lojistas_representantes_on_lojista_id"
    t.index ["representante_id"], name: "index_representantes_lojistas_on_representante_id"
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer "user_id"
    t.string "action_method"
    t.integer "action_value"
    t.boolean "had_errors", default: false
    t.string "target_model"
    t.integer "target_id"
    t.text "target_data"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer "action_id"
    t.string "related_change_type"
    t.integer "related_change_id"
    t.string "description"
    t.datetime "created_at"
  end

  create_table "merit_scor_points", force: :cascade do |t|
    t.bigint "score_id"
    t.integer "num_points", default: 0
    t.string "log"
    t.datetime "created_at"
    t.index ["score_id"], name: "index_merit_scor_points_on_score_id"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.bigint "sash_id"
    t.string "category", default: "default"
    t.index ["sash_id"], name: "index_merit_scores_on_sash_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "produto_id"
    t.bigint "solicitacao_id"
    t.integer "quantidade"
    t.index ["produto_id"], name: "index_produtos_solicitacoes_on_produto_id"
    t.index ["solicitacao_id"], name: "index_solicitacoes_produtos_on_solicitacao_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "descricao"
    t.float "preco"
    t.bigint "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_produtos_on_cliente_id"
  end

  create_table "representantes", force: :cascade do |t|
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
    t.datetime "deleted_at"
    t.string "slug"
    t.index ["cidade_id"], name: "index_representantes_on_cidade_id"
    t.index ["deleted_at"], name: "index_representantes_on_deleted_at"
    t.index ["slug"], name: "index_representantes_on_slug", unique: true
    t.index ["usuario_id"], name: "index_representantes_on_usuario_id"
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setores", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicitacoes", force: :cascade do |t|
    t.bigint "representante_id"
    t.bigint "cliente_id"
    t.bigint "lojista_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["cliente_id"], name: "index_solicitacoes_on_cliente_id"
    t.index ["lojista_id"], name: "index_solicitacoes_on_lojista_id"
    t.index ["representante_id"], name: "index_solicitacoes_on_representante_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo"
    t.datetime "deleted_at"
    t.integer "sash_id"
    t.integer "level", default: 0
    t.index ["deleted_at"], name: "index_usuarios_on_deleted_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["invitation_token"], name: "index_usuarios_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "produtos", "clientes"
  add_foreign_key "representantes", "cidades"
  add_foreign_key "solicitacoes", "clientes"
  add_foreign_key "solicitacoes", "lojistas"
  add_foreign_key "solicitacoes", "representantes"
end
