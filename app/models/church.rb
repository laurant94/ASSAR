class Church < ApplicationRecord
  enum categories: { Bonbon: 1, Billard: 2 }

  belongs_to :admin, class_name: "User", foreign_key: "admin_id"
  has_many :childs
end