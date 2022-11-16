class ChangingNullToNotNullTimestampsColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tokens , :updated_at , false
  end
end
