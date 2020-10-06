class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true
  validates :username, length: { in: 6..20 }
  validates :username, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true

  # Recoverable Module only works as designed if email addresses are unique
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]

  has_many :stories, dependent: :destroy
  has_many :tags, dependent: :destroy

  def email_required?
    false
  end

  # Needed because of Recoverable module
  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
