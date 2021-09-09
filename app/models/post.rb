class Post < ApplicationRecord
  validates :thumb, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :child

  enum marks: { posts: 1 }
  mount_uploader :thumb, ThumbUploader
end
