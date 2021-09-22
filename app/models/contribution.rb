class Contribution < ApplicationRecord
  belongs_to :post
  belongs_to :faithful, class_name: "User", foreign_key: "faithful_id"

  enum marks: { Dime: 1, Contribution: 2 }
end