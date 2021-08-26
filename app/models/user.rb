class User < ApplicationRecord

  enum role: { client: 1, manager: 2, secretary: 3, president: 4, admin: 5, super_admin: 6 }
  
  validates :email, presence: true, uniqueness: { case_sensitive: true }, 
    length: {maximum: 255}, 
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :password, presence: false, length: { minimum:6,  maximum: 50}
  # validates :username, presence: false, 
  #   uniqueness: { case_sensitive: false }, 
  #   format: { with: /\A[a-zA-Z0-9_]{2,20}\z/, message: "ne doit contenir que des eractères alphanumeriques" }
  validates :phone, presence: true, uniqueness: { case_sensitive: true }

  has_one :managed_church, class_name: "Church", foreign_key: "admin_id"
  has_one :preside_child, class_name: "Child", foreign_key: "president_id"
  has_one :vice_preside_child, class_name: "Child", foreign_key: "vice_president_id"
  has_one :secretaried_child, class_name: "Child", foreign_key: "secretary_id"
  has_one :managed_child, class_name: "Child", foreign_key: "manager_id"
  has_one :admin_child, class_name: "Child", foreign_key: "admin_id"
  has_and_belongs_to_many :childs, join_table: "children_faithful", foreign_key: "faithful_id"

  has_secure_password
  has_secure_token :token

  # accepts_nested_attributes_for :church, update_only: true

  def to_session
    {id: id}
  end

  def managed_church?
    self.managed_church.present?
  end

  def managed_child?
    self.admin_child.present?
  end

  def preside_child?
    self.preside_child.present?
  end

  def vice_preside_child?
    self.vice_preside_child.present?
  end

end
