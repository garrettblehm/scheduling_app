# frozen_string_literal: true

class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :note
      t.references :business, null: false, foreign_key: true
      t.integer :max_capacity

      t.timestamps
    end
    add_index :slots, :starts_at
  end
end
