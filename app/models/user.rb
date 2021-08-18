class User < ApplicationRecord
  has_one :church, class_name: "Church", foreign_key: "admin_id"

  has_secure_password
  has_secure_token :token

  accepts_nested_attributes_for :church, update_only: true
end
