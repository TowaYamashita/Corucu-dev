class Status < ApplicationRecord
  has_many :users

  validates :professor_flag, inclusion: { in: [true, false] }
  validates :student_flag, inclusion: { in: [true, false] }
  validates :guest_flag, inclusion: { in: [true, false] }
end
