class CreateSubstitutes < ActiveRecord::Migration[5.2]
  def change
    create_table :substitutes do |t|
      t.date :changed_at
      t.integer :period
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
