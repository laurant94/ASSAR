class Connected < ApplicationRecord
  # association connected && 
  belongs_to :target, class_name: "Child", foreign_key: "parent_id"
  belongs_to :auth, class_name: "Child", foreign_key: "auth_id"

end