class RemoveFieldsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :CNPJ, :string
    remove_column :users, :job_title, :string
    remove_column :users, :company_name, :string
    remove_column :users, :shipper, :boolean, default: false
    remove_column :users, :carrier, :boolean, default: false
  end
end
