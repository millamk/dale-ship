class AddFieldsToShipper < ActiveRecord::Migration[5.2]
  def change
    add_column :shippers, :first_name, :string
    add_column :shippers, :last_name, :string
    add_column :shippers, :CNPJ, :string
    add_column :shippers, :job_title, :string
    add_column :shippers, :company_name, :string
  end
end
