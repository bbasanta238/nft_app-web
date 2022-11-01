class RenameTopkenidToTokenIdInTokens < ActiveRecord::Migration[7.0]
  def change
    rename_column :tokens, :topkenId, :tokenID
  end
end
