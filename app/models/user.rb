class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :forms_uploads, class_name: "Forms::Upload", dependent: :destroy

  def is_coach?
    self.type == "Users::Coach"
  end
end
