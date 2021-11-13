class CreateLogErrors < ActiveRecord::Migration[6.1]
  def change
    create_table LogError.table_name do |t|
      t.boolean :treated                 , comment: 'Se o Erro já foi Tratado'  , default: false
      t.text    :data                    , comment: 'Conteudo em Json'
      t.string  :tipo                    , comment: 'Tipo de erro'
      t.string  :error                    , comment: 'ERRO'
      t.timestamps
    end
  end
end
