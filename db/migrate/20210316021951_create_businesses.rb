# frozen_string_literal: true

class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
