class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :status, foreign_key: true
    add_column :users, :admin_user, :boolean, default: false, null: false
  end
end
