class AddScheduledAtToAddExaminations < ActiveRecord::Migration[5.2]
  def change
    add_column :add_examinations, :scheduled_at, :date
  end
end
