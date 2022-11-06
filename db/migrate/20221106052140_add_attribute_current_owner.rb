class AddAttributeCurrentOwner < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens , :current_owner , :string
  end
end
