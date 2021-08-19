class CreateImportData < ActiveRecord::Migration[6.1]
  def change
    create_table ImportDatum.table_name do |t|
      t.float :total                 , comment: 'Total de registros a serem importados'
      t.float :sucess                , comment: 'Sucesso na importação do Registro'
      t.float :erros                 , comment: 'Erros na importação do Registro'
      t.float :order_file            , comment: 'Erros na importação do Registro'
      t.belongs_to Import.table_name , comment: 'Relacionamento com Import'

      t.timestamps
    end
  end
end
