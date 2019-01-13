class Post < ApplicationRecord
  validates :content, presence: true,
                          length: { minimum: 1 }
end
