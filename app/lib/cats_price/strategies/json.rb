module CatsPrice
  module Strategies
    module Json
      module_function
      def parse(data)
        Oj.load(data, symbol_keys: true)
      end
    end
  end
end
