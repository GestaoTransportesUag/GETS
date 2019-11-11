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

ActiveRecord::Schema.define(version: 20191101124242) do

  create_table "manutencaos", force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "veiculo_id"
    t.text "descricao"
    t.float "custo"
    t.text "realizadoEm"
    t.date "realizadoQuando"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_manutencaos_on_usuario_id"
    t.index ["veiculo_id"], name: "index_manutencaos_on_veiculo_id"
  end

  create_table "motorista", force: :cascade do |t|
    t.bigint "cpf"
    t.string "nome"
    t.bigint "diasDeFolga"
    t.boolean "bancoDeHoras"
    t.bigint "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer "cpf", limit: 8
    t.string "nome"
    t.string "senha"
    t.string "email"
    t.integer "telefone", limit: 8
    t.boolean "capacidadeDeGerencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "modelo"
    t.integer "ano"
    t.string "cor"
    t.bigint "quilometragem"
    t.boolean "manutencaoEmDia"
    t.boolean "alocado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viagems", force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "veiculo_id"
    t.integer "motorista_id"
    t.bigint "distanciaPercorrida"
    t.string "nomeRequisor"
    t.text "finalidade"
    t.string "funcaoRequisitor"
    t.bigint "cpfRequisitor"
    t.text "descricaoImprevistos"
    t.integer "numAcompanhantes"
    t.bigint "dataPartida"
    t.bigint "dataChegada"
    t.string "destino"
    t.bigint "horaSaida"
    t.bigint "horaChegada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motorista_id"], name: "index_viagems_on_motorista_id"
    t.index ["usuario_id"], name: "index_viagems_on_usuario_id"
    t.index ["veiculo_id"], name: "index_viagems_on_veiculo_id"
  end

end
