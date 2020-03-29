class CreateAddExaminations < ActiveRecord::Migration[5.2]
  def change
    create_table :add_examinations do |t|
      t.string :category
      t.references :subject, foreign_key: true
      t.string :place
      t.text :comment

      t.timestamps
    end
  end
end
