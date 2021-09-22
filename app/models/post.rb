class Post < ApplicationRecord
  
  # validates :thumb, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :child
  # Association de contribution
  has_many :contributions
  has_many :faithfuls, class_name: "User", foreign_key: "faithful_id", through: :contributions

  enum marks: { post: 1, event: 2, collecte: 3 }
  mount_uploader :thumb, ThumbUploader

  scope :mark_post, -> { where(:mark => marks[:post])}
  scope :mark_event, -> { where(:mark => marks[:event])}
  scope :mark_collect, -> { where(:mark => marks[:collecte])}
end
