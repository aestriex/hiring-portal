class JobPosting < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections

  validates :title, presence: true
  validates :department, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: %w[draft open closed] }

  def status_badge_classes
    case status
    when "open" then "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200"
    when "closed" then "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200"
    when "draft" then "bg-muted text-muted-foreground"
    end
  end
end