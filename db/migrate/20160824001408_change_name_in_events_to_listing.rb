class ChangeNameInEventsToListing < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :name, :listing
  end
end
