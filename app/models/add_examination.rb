class AddExamination < ApplicationRecord
  belongs_to :subject
  belongs_to :user
end
