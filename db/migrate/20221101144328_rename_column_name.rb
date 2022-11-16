class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :tokens, :tokenID, :token_ID
    rename_column :tokens, :tokenURI, :token_URI
    rename_column :tokens, :imageURI, :image_URI
  end
end
