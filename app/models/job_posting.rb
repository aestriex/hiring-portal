class JobPosting < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: %w[draft open closed] }
end