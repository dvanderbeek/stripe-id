require "friendly_id"
require "stripe/id/railtie"
require "stripe/id/generator"

module Stripe
  module Id
    extend ActiveSupport::Concern

    included do
      def stripe_id
        Generator.new(stripe_id_prefix).token
      end
    end
 
    class_methods do
      def stripe_id(prefix)
        cattr_accessor :stripe_id_prefix
        @@stripe_id_prefix = prefix

        extend FriendlyId
        friendly_id :stripe_id, use: :slugged
      end
    end
  end
end
