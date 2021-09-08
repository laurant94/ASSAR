class Group < ApplicationRecord
  belongs_to :child
  belongs_to :manager, class_name: "User", foreign_key: "manager_id", required: false
  has_and_belongs_to_many :faithfuls, join_table: "faithful_group", class_name: "App::Faithful", foreign_key: "group_id"
end
