class Post < ApplicationRecord
  belongs_to :blog
  validates :name, presence: true,
                    length: { minimum: 5 }

  after_create :create_in_filesystem
  after_update :copy_to_file
  before_destroy :remove_from_filesystem

  def create_in_filesystem
    `cd #{self.blog.path} && touch #{self.path}`
    self.copy_to_file()
  end

  def copy_to_file
    File.write("#{self.blog.path}/_posts/#{self.path}", self.header+"\n"+"\n"+self.content)
  end

  def remove_from_filesystem
    `rm #{self.blog.path}/_posts/#{self.path}`
  end
end
