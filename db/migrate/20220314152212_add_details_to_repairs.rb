# frozen_string_literal: true

class AddDetailsToRepairs < ActiveRecord::Migration[7.0]
  def change
    add_column :repairs, :name, :string
    add_column :repairs, :amount, :integer
    add_reference :repairs, :user, null: false, foreign_key: true
  end
end
