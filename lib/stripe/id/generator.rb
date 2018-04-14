module Stripe
  module Id
    class Generator
      attr_reader :token

      def initialize(prefix)
        @token = "#{prefix.downcase}_#{generate_token}"
      end

      def to_s
        token
      end

      private

      def generate_token
        SecureRandom.urlsafe_base64(10).gsub(/[-_]/, random_replacement.to_s)
      end

      def random_replacement
        ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample
      end
    end
  end
end