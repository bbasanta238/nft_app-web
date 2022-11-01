class RenameDescritionAttribute < ActiveRecord::Migration[7.0]
  def change
    rename_column :tokens, :desctiption, :description
  end
end
