module CatsPrice
  module Shops
    class Shop
      attr_reader :strategy, :transport

      def initialize(strategy:, transport:)
        @strategy  = strategy
        @transport = transport
      end

      def data
        @data ||= raw_data.map { |datum| mapper.new(datum).to_h }
      end

      private

      def url
        rase NotImplementedError
      end

      def mapper
        rase NotImplementedError
      end

      def raw_data
        rase NotImplementedError
      end
    end
  end
end
