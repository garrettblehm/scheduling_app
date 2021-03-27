# frozen_string_literal: true

class Business < ApplicationRecord
  # include Addressable

  belongs_to :user
  has_one_attached :logo
  serialize :address, Hash

  validates :name, presence: true
  validate :address_fields_are_present, if: -> { address.present? }

  private

  def address_fields_are_present
    errors.add(:address, :blank, message: 'street must be provided') if address[:street].blank?
    errors.add(:address, :blank, message: 'city must be provided') if address[:city].blank?
    errors.add(:address, :blank, message: 'state must be provided') if address[:state].blank?
    errors.add(:address, :blank, message: 'zipcode must be provided') if address[:zipcode].blank?
  end
end
