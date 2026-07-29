class Section < ApplicationRecord
  belongs_to :job_posting
  has_many :questions, dependent: :destroy

  validates :title, presence: true
end