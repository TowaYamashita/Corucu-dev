class AddPermissionIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :permission, foreign_key: true
  end
end
