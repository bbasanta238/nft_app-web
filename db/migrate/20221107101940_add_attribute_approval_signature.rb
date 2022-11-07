class AddAttributeApprovalSignature < ActiveRecord::Migration[7.0]
  def change
    add_column :list_tokens, :approval_signature , :string
  end
end
