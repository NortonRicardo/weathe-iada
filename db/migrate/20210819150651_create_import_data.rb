class CreateImportData < ActiveRecord::Migration[6.1]
  def change
    create_table ImportDatum.table_name do |t|
      t.float :total                 , comment: 'Total de registros a serem importados' , default: 0.0
      t.float :erros                 , comment: 'Erros na importação do Registro'       , default: 0.0
      t.float :sucess                , comment: 'Sucesso na importação do Registro'     , default: 0.0
      t.string :path_file            , comment: 'Caminho do arquivo salvo localmente'  , default: ''
      t.boolean :finish              , comment: 'Erros na importação do Registro'       , default: false
      t.belongs_to Import.table_name , comment: 'Relacionamento com Import'

      t.timestamps
    end
  end
end
