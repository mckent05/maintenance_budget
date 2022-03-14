# frozen_string_literal: true

class AddDetailsToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :name, :string
    add_column :equipment, :icon, :string
  end
end
