class ChangeNameInHobbiesToSport < ActiveRecord::Migration[5.0]
  def change
    rename_column :hobbies, :name, :sport
  end
end
