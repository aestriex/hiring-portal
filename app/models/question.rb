class Question < ApplicationRecord
  belongs_to :section

  validates :label, presence: true
  validates :question_type, presence: true
end