class LogError < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_log_error"
  self.sequence_name = "tb_log_error_seq"
  # relationships .............................................................
  # validations ...............................................................
  # callbacks .................................................................
end
