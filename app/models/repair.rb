class Repair < ApplicationRecord
  has_many :equipmentrepairs, class_name: 'Equipmentrepair', foreign_key: 'repairs_id', dependent: :destroy
  has_many :equipments, through: :equipmentrepairs

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
