class AddPhotoToCarriers < ActiveRecord::Migration[5.2]
  def change
    add_column :carriers, :photo, :string
  end
end
