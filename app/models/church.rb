class Church < ApplicationRecord
  enum categories: { Bonbon: 1, Billard: 2 }

  belongs_to :manager, -> {includes :managed_church}, class_name: "App::Faithful", foreign_key: "manager_id"
  has_many :childs
  has_one :setting
end