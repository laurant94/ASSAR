class GroupMessage < ApplicationRecord
  has_one :replay, class_name: "GroupMessage", foreign_key: "replay_id"
  belongs_to :faithful, class_name: "User", foreign_key: "user_id"
  belongs_to :group, class_name: "Group", foreign_key: "group_id"
  # belongs_to :replay, class_name: "GroupMessage", foreign_key: "replay_id"
end
