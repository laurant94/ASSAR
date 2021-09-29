class Church < ApplicationRecord
  default_scope { includes(:setting) }
  enum categorie: { Bonbon: 1, Billard: 2 }

  # Association connecteds
  has_many :targets, class_name: "Connected", foreign_key: "parent_id"
  has_many :auths, class_name: "Connected", foreign_key: "auth_id"

  belongs_to :manager, -> {includes :managed_church}, class_name: "App::Faithful", foreign_key: "manager_id"
  has_many :childs
  has_one :setting
end