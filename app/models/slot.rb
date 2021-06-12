# frozen_string_literal: true

class Slot < ApplicationRecord
  belongs_to :business

  validates :starts_at, :ends_at, presence: true
  validate :starts_at_is_before_ends_at

  private

  def starts_at_is_before_ends_at
    errors.add(:base, "starts at must be before ends at") unless starts_at.before?(ends_at)
  end
end
