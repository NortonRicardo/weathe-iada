class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table Import.table_name do |t|
      t.float :total_files    , comment: 'Total de Arquivos'
      t.string :cdg_import    , comment: 'Indentificador unico do import'
      t.boolean :termino      , comment: 'Indentifica se terminou o processo', default: false

      t.timestamps
    end
  end
end
