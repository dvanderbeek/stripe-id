module Stripe
  module Id
    class Generator
      attr_reader :token, :token_length

      def initialize(prefix, token_length: 14)
        @token_length = token_length
        @token = "#{prefix.downcase}_#{generate_token}"
      end

      def to_s
        token
      end

      private

      def generate_token
        SecureRandom.urlsafe_base64(token_bytes).gsub(/[-_]/, random_replacement.to_s)
      end

      def random_replacement
        ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample
      end

      def token_bytes
        (token_length / (4.0 / 3.0)).truncate
      end
    end
  end
end
