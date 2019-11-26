class AddFieldsToCarrier < ActiveRecord::Migration[5.2]
  def change
    add_column :carriers, :first_name, :string
    add_column :carriers, :last_name, :string
    add_column :carriers, :CNPJ, :string
    add_column :carriers, :job_title, :string
    add_column :carriers, :company_name, :string
  end
end
