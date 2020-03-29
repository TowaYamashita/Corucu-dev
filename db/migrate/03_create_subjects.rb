class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :course
      t.string :instructor

      t.timestamps
    end
  end
end
