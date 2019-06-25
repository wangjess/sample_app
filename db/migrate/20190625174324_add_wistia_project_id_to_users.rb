class AddWistiaProjectIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wistia_project_id, :string
  end
end
