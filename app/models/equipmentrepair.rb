# frozen_string_literal: true

class Equipmentrepair < ApplicationRecord
    belongs_to :repair, class_name: "Repair", foreign_key: "repairs_id"
    belongs_to :equipment, class_name: "Equipment", foreign_key: "equipment_id"
end
