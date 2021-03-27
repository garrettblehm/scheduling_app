# frozen_string_literal: true

json.extract! slot, :id, :starts_at, :ends_at, :note, :business_id, :max_capacity, :created_at, :updated_at
json.url slot_url(slot, format: :json)
