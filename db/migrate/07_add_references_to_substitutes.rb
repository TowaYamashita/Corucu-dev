class AddReferencesToSubstitutes < ActiveRecord::Migration[5.2]
  def change
    add_reference :substitutes, :user, foreign_key: true
  end
end
