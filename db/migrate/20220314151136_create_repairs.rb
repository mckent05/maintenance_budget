# frozen_string_literal: true

class CreateRepairs < ActiveRecord::Migration[7.0]
  def change
    create_table :repairs, &:timestamps
  end
end
