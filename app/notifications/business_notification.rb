# frozen_string_literal: true

# To deliver this notification:
#
# BusinessNotification.with(post: @post).deliver_later(current_user)
# BusinessNotification.with(post: @post).deliver(current_user)

class BusinessNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params

  param :business, :method

  # Define helper methods to make rendering easier.

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  def message
    t('.create.message') if params[:method] == :create
  end

  def url
    business_path(params[:business][:id])
  end
end
