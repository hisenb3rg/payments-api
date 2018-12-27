class AddVersionAndOrgIdToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :version, :integer
    add_column :payments, :organisation_id, :string
  end
end
