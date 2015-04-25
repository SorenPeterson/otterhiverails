class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :description, :text
    add_column :projects, :image, :string
    add_column :projects, :link, :string
  end
end
