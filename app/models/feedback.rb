class Feedback < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :name, presence: true, length: {maximum: Settings.max_name_feedback}
  validates :title, presence: true,
    length: {maximum: Settings.max_title_feedback}
  validates :content, presence: true,
    length: {maximum: Settings.max_content_feedback}
end
