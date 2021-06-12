# frozen_string_literal: true

json.extract! slot, :id, :starts_at, :ends_at, :note, :business_id, :max_capacity, :created_at, :updated_at
json.url business_slot_url([@business, slot], format: :json)
