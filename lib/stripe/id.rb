require "friendly_id"
require "stripe/id/railtie"
require "stripe/id/generator"

module Stripe
  module Id
    extend ActiveSupport::Concern
 
    class_methods do
      def stripe_id(prefix)
        extend FriendlyId
        friendly_id -> { Generator.new(prefix.to_s).token }, use: :slugged
      end
    end
  end
end
