class RenameTokenModel < ActiveRecord::Migration[7.0]
  def change
    rename_column :tokens, :token_ID, :token_id
    rename_column :tokens, :token_URI, :token_uri
    rename_column :tokens, :image_URI, :image_uri
  end
end
