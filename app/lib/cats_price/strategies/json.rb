module CatsPrice
  module Strategies
    module Json
      module_function
      def parse(data)
        Oj.load(data, symbol_keys: true)
      rescue
        # Notification like sentry or whatever here
        # Probably log
        raise Error::ResponseParserError
      end
    end
  end
end
