class SwitchSessionIdToIpAddr < ActiveRecord::Migration
  def change
    remove_column :visitors, :session_id, :string
    add_column :visitors, :ip_addr, :string
  end
end
