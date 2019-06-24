class AddWistiaProjectToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wistia_project, :integer
  end
end
