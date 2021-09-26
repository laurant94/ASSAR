class Favorite < ApplicationRecord
  belongs_to :faithful, class_name: "User", foreign_key: "user_id"
  belongs_to :post

  scope :liked, -> { where(:liked => true)}
end