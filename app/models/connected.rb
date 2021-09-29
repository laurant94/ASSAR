class Connected < ApplicationRecord
  # association connected && 
  belongs_to :target, class_name: "Church", foreign_key: "parent_id"
  belongs_to :auth, class_name: "Church", foreign_key: "auth_id"

end