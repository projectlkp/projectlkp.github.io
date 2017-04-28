class Post < ApplicationRecord
  belongs_to :blog
  validates :name, presence: true,
                    length: { minimum: 5 }

end
