class Substitute < ApplicationRecord
  belongs_to :subject
  belongs_to :user

  validates :changed_at, presence: true
  validates :period, presence: true,
                     numericality: true,
                     inclusion: {in: 1..4}
  validates :subject, presence: true
  validates :user, presence:true
end
