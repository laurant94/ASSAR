class Post < ApplicationRecord
  
  # attr_accessor :marks
  # validates :thumb, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :child
  # Association de contribution
  has_many :contributions
  has_many :faithfuls, class_name: "User", foreign_key: "faithful_id", through: :contributions

  # Association likes
  has_many :likes
  has_many :faithfuls, class_name: "User", foreign_key: "user_id", through: :likes

  # association comments
  has_many :comments
  has_many :faithfuls, class_name: "User", foreign_key: "user_id", through: :comments

  # association favorites
  has_many :favorites
  has_many :faithfuls, class_name: "User", foreign_key: "user_id", through: :favorites
  
  enum mark: { post: 1, event: 2, collecte: 3 }
  mount_uploader :thumb, ThumbUploader

  scope :mark_post, -> { where(:mark => marks[:post])}
  scope :mark_event, -> { where(:mark => marks[:event])}
  scope :mark_collect, -> { where(:mark => marks[:collecte])}
  scope :filtered, ->(type) { where(:mark => type ) unless type.nil? }

end
