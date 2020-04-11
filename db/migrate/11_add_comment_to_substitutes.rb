class AddCommentToSubstitutes < ActiveRecord::Migration[5.2]
  def change
    add_column :substitutes, :comment, :text
  end
end
