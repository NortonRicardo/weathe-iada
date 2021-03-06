class ImportDatum < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_import_data"
  self.sequence_name = "tb_import_data_seq"
  # relationships .............................................................
  belongs_to :import, class_name: 'Import', foreign_key: :tb_import_id
  has_one_attached :file, dependent: :detach
  # validations ...............................................................
  # callbacks .................................................................
   before_destroy :delete_file
  #


  def delete_file
    self.file.purge
  end

  def file_dowlod
    self.file.download
  end
end
