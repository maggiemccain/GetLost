class AddImagePhotoToHobbies < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :image_photo, :text
  end
end
