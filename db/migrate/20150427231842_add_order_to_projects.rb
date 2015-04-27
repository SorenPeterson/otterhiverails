class AddOrderToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :order_id, :integer
    add_index :projects, :order_id
  end
end
