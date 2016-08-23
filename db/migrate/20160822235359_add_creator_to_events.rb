class AddCreatorToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :creator, :integer
  end
end
