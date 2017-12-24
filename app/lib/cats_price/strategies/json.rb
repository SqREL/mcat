module CatsPrice
  module Strategies
    class Json
      def parse(data)
        JSON.parse(data)
      end
    end
  end
end
