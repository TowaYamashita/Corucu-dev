class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.boolean :professor_flag, default: false, null: false
      t.boolean :student_flag, default: false, null: false
      t.boolean :guest_flag, default: false, null: false
    end
  end
end
