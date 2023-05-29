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

ActiveRecord::Schema.define(version: 20210729171530) do

  create_table "celulars", force: :cascade do |t|
    t.integer "funcionario_id"
    t.string "numero_celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_celulars_on_funcionario_id"
  end

  create_table "emails", force: :cascade do |t|
    t.integer "funcionario_id"
    t.string "endereço_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_emails_on_funcionario_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.string "data_nascimento"
    t.string "sexo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "municipio_nascimento"
    t.string "estado_nascimento"
    t.string "estado_civil"
    t.integer "workspace_id"
    t.integer "job_role_id"
    t.index ["job_role_id"], name: "index_funcionarios_on_job_role_id"
    t.index ["workspace_id"], name: "index_funcionarios_on_workspace_id"
  end

  create_table "job_roles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.integer "funcionario_id"
    t.string "numero_telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_telefones_on_funcionario_id"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
