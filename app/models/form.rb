class Form < ApplicationRecord
  has_one_attached :document

  validates :description, :title, presence: true
end
