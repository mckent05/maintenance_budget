# frozen_string_literal: true

class AddDetailsToEquipmentRepair < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipmentrepairs, :repairs, null: false, foreign_key: true
    add_reference :equipmentrepairs, :equipment, null: false, foreign_key: true
  end
end
