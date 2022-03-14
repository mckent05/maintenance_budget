# frozen_string_literal: true

class AddReferenceToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipment, :user, null: false, foreign_key: true
  end
end
