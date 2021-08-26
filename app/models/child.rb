class Child < ApplicationRecord
  belongs_to :church
  belongs_to :president, class_name: "App::Faithful", foreign_key: "president_id"
  belongs_to :vice_president, class_name: "App::Faithful", foreign_key: "vice_president_id"
  belongs_to :secretary, class_name: "App::Faithful", foreign_key: "secretary_id"
  belongs_to :manager, class_name: "App::Faithful", foreign_key: "manager_id"
  belongs_to :admin, class_name: "App::Faithful", foreign_key: "admin_id"
  has_and_belongs_to_many :faithfuls, join_table: "children_faithful", class_name: "App::Faithful", foreign_key: "child_id"

end