class AddPhotoToShippers < ActiveRecord::Migration[5.2]
  def change
    add_column :shippers, :photo, :string
  end
end
