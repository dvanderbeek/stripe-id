require "friendly_id"
require "stripe/id/railtie"
require "stripe/id/generator"

module Stripe
  module Id
    extend ActiveSupport::Concern

    mattr_accessor :prefix_map


    included do
      def stripe_id
        Generator.new(Stripe::Id.prefix_map[self.class.name]).token
      end
    end
 
    class_methods do
      def stripe_id(prefix)
        Stripe::Id.prefix_map ||= {}
        Stripe::Id.prefix_map[self.name] = prefix

        extend FriendlyId
        friendly_id :stripe_id, use: :slugged
      end
    end
  end
end
