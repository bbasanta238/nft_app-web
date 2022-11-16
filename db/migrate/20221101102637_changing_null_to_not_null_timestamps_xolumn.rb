class ChangingNullToNotNullTimestampsXolumn < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tokens , :created_at , false
  end
end
