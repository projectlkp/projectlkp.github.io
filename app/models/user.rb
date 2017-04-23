class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: :recoverable
  devise :database_authenticatable, :registerable,
        :rememberable, :trackable, :validatable

  validates :username, format: { with: /\A[a-zA-Z]+\Z/ }
  validates_presence_of   :username
  validates_uniqueness_of :username

 has_many :blogs, :dependent => :destroy

 def email_required?
   false
 end

 def email_changed?
   false
 end
end
