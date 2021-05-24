class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_one :profile, dependent: :destroy

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
