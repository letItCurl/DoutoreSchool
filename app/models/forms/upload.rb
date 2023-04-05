class Forms::Upload < ApplicationRecord
  belongs_to :user
  belongs_to :form

  has_one_attached :document
end
