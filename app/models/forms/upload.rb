class Forms::Upload < ApplicationRecord
  belongs_to :user
  belongs_to :form

  scope :only_student_uploads, -> { joins(:user).where(users: { type: "Users::Student" }) }

  has_one_attached :document
end
