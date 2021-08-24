class Child < ApplicationRecord
  belongs_to :church
  belongs_to :president, class_name: "User", foreign_key: "president_id"
  belongs_to :vice_president, class_name: "User", foreign_key: "vice_president_id"
  belongs_to :secretary, class_name: "User", foreign_key: "secretary_id"
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"
  belongs_to :admin, class_name: "User", foreign_key: "admin_id"
  has_and_belongs_to_many :faithfuls, class_name: 'User', join_table: "children_user", foreign_key: "faithful_id"

end