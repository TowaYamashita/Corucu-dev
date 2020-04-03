class AddReferencesToAddExaminations < ActiveRecord::Migration[5.2]
  def change
    add_reference :add_examinations, :user, foreign_key: true
  end
end
