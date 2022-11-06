class AddColumnToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :owner, :string
  end
end
