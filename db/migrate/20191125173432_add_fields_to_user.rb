class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :CNPJ, :string
    add_column :users, :job_title, :string
    add_column :users, :company_name, :string
    add_column :users, :user_type, :string
  end
end
