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

 after_create :create_blog
 after_create :create_github_repo
 after_create :publish_blog

 def create_blog()
   blog=Blog.new
   blog.user_id=self.id
   blog.name=self.username
   blog.url="#{Rails.configuration.lkp['base_url']}/#{self.username}"
   blog.theme="#{Rails.configuration.lkp['default_theme']}"
   blog.description="#{Rails.configuration.lkp['default_description']}"
   blog.about="#{Rails.configuration.lkp['default_about']}"
   blog.twitter="#{Rails.configuration.lkp['default_twitter']}"
   blog.email="#{Rails.configuration.lkp['default_email']}"
   blog.save!
 end

 def create_github_repo()
   puts "dasdsadsd"
   # new project repo on github
   system("cd scripts && chmod +x create.sh")
   system("cd scripts && create.sh #{self.username} #{Rails.configuration.lkp['gitusername']} d3681aedc44d7dce791132b00f3359ade929a54d")
 end

 def publish_blog()
   self.blogs.first.publish()
 end

 def email_required?
   false
 end

 def email_changed?
   false
 end
end
