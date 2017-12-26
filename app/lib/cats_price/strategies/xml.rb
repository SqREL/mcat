module CatsPrice
  module Strategies
    module Xml
      module_function

      def parse(data)
        parser = Nori.new(
          convert_tags_to: ->(tag) { tag.snakecase.to_sym },
          strip_namespaces: true
        )
        parser.parse(data)
      rescue StandardError
        # Notification like sentry or whatever here
        # Probably log
        raise Error::ResponseParserError
      end
    end
  end
end
