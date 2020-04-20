class AddExamination < ApplicationRecord
  belongs_to :subject
  belongs_to :user

  validates :category, presence: true,
                       inclusion: { in: %w(追試 再試) }
  validates :place, presence: true
  validates :scheduled_at, presence: true
  validates :user_id, presence: true
  validates :subject_id, presence: true
end
