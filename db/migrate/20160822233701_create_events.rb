class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :state
      t.float :latitude
      t.float :longitude
      t.text :image_url
      t.string :attendees
      t.references :hobby, foreign_key: true

      t.timestamps
    end
  end
end
