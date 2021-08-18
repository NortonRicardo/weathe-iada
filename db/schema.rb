# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_18_111929) do

  create_table "imports", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tb_weather_data", charset: "utf8mb3", force: :cascade do |t|
    t.date "data", comment: "Data da Leitura"
    t.time "hora", comment: "Hora da Leitura"
    t.float "prec_total_horario", comment: "PRECIPITA«√O TOTAL, HOR¡RIO (mm)"
    t.float "pres_atmos_nivel_estacao", comment: "PRESSAO ATMOSFERICA AO NIVEL DA ESTACAO, HORARIA (mB)"
    t.float "pres_atmos_max", comment: "PRESS√O ATMOSFERICA MAX.NA HORA ANT. (AUT) (mB)"
    t.float "pres_atmos_min", comment: "PRESS√O ATMOSFERICA MIN. NA HORA ANT. (AUT) (mB)"
    t.float "radiacao_global", comment: "RADIACAO GLOBAL (KJ/m≤)"
    t.float "temp_ar_bulso_seco", comment: "TEMPERATURA DO AR - BULBO SECO, HORARIA (∞C)"
    t.float "temp_ponto_orvalho", comment: "TEMPERATURA DO PONTO DE ORVALHO (∞C)"
    t.float "temp_min_hora_ant", comment: "TEMPERATURA M¡XIMA NA HORA ANT. (AUT) (∞C)"
    t.float "temp_monima_hora_ant", comment: "TEMPERATURA MÕNIMA NA HORA ANT. (AUT) (∞C)"
    t.float "temp_orvalho_max_hora_ant", comment: "TEMPERATURA ORVALHO MAX. NA HORA ANT. (AUT) (∞C)"
    t.float "temp_orvalho_min_hora_ant", comment: "TEMPERATURA ORVALHO MIN. NA HORA ANT. (AUT) (∞C)"
    t.float "umid_rel_max_hora_ant", comment: "UMIDADE REL. MAX. NA HORA ANT. (AUT) (%)"
    t.float "umid_rel_min_hora_ant", comment: "UMIDADE REL. MIN. NA HORA ANT. (AUT) (%)"
    t.float "umid_relativa_ar", comment: "UMIDADE RELATIVA DO AR, HORARIA (%)"
    t.float "vento_direcao_horario", comment: "VENTO, DIRE«√O HORARIA (gr) (∞ (gr))"
    t.float "vento_rajada_maxima", comment: "VENTO, RAJADA MAXIMA (m/s)"
    t.float "vento_velocidade_horario", comment: "VENTO, VELOCIDADE HORARIA (m/s)"
    t.bigint "tb_weather_station_id", comment: "Relacionamento com estacao climativa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tb_weather_station_id"], name: "index_tb_weather_data_on_tb_weather_station_id"
  end

  create_table "tb_weather_station", charset: "utf8mb3", force: :cascade do |t|
    t.string "region", comment: "REGIAO"
    t.string "state", comment: "UF"
    t.string "station", comment: "ESTADO"
    t.string "wmo_code", comment: "CODIGO (WMO)"
    t.string "latitude", comment: "LATITUDE"
    t.string "longitude", comment: "LONGITUDE"
    t.string "altitude", comment: "ALTITUDE"
    t.date "foundation", comment: "DATA DE FUNDACAO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
