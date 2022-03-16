# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :equipments, class_name: "Equipment", foreign_key: "user_id",  dependent: :destroy
        has_many :repairs, class_name: "Repair", foreign_key: "user_id",  dependent: :destroy

        validates :name, presence: true
end
