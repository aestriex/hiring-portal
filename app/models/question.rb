class Question < ApplicationRecord
  QUESTION_TYPES = %w[short_text long_text file_upload checkbox email link dropdown].freeze

  belongs_to :section

  validates :label, presence: true
  validates :question_type, presence: true, inclusion: { in: QUESTION_TYPES }
end