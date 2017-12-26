module CatsPrice
  module Shops
    class Mapper
      def initialize(data)
        @data = data
      end

      def to_h
        raise NotImplementedError
      end

      private

      attr_reader :data
    end
  end
end
