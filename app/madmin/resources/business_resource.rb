# frozen_string_literal: true

class BusinessResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :description
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :user
end
