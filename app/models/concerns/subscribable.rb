module Subscribable
  extend ActiveSupport::Concern

  included do
    after_create :subscribe!
  end

  def subscribe!
    delay.subscribe_to_mailchimp if Rails.env.production?
  end

  def subscribe_to_mailchimp
    Gibbon::API.lists.subscribe({ id: default_list_id,
                                  email: { email: email },
                                  double_optin: false })
  end

  def default_list_id
    '552c5e7e11'
  end

end
