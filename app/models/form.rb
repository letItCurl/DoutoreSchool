class Form < ApplicationRecord
  has_one_attached :document

  has_many :forms_uploads, class_name: "Forms::Upload", dependent: :destroy

  validates :description, :title, presence: true
end
