# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Convert the database records to Noticed notification instances so we can use helper methods
    notifications = current_user.notifications.unread
    @notifications = notifications.map(&:to_notification)
    # notifications.mark_as_read!
  end
end
