class CreateListTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :list_tokens do |t|
      t.integer :token_id
      t.float :list_price
      t.boolean :is_listed

      t.timestamps
    end
  end
end
