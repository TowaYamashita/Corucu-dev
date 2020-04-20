class Subject < ApplicationRecord
  validates :course, presence: true
  validates :instructor, presence: true
end
