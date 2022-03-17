class Equipment < ApplicationRecord
  has_many :equipmentrepairs, class_name: 'Equipmentrepair', foreign_key: 'equipment_id', dependent: :destroy
  has_many :repairs, through: :equipmentrepairs

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :icon, presence: true
end
