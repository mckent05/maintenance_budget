# frozen_string_literal: true

class CreateEquipmentrepairs < ActiveRecord::Migration[7.0]
  def change
    create_table :equipmentrepairs, &:timestamps
  end
end
