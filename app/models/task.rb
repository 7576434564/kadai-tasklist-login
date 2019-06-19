class Task < ApplicationRecord
  belongs_to :taskuser
  validates :status, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 255 }
end
