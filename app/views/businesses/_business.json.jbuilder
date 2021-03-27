# frozen_string_literal: true

json.extract! business, :id, :name, :description, :created_at, :updated_at
json.url business_url(business, format: :json)
