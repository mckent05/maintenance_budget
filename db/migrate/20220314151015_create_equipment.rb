# frozen_string_literal: true

class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment, &:timestamps
  end
end
