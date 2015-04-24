class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :session_id

      t.timestamps null: false
    end
  end
end
