class AddAttrsToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :name, :string
    add_column :tokens, :desctiption, :string
    add_column :tokens, :imageURI, :string
  end
end
