module CatsPrice
  module Shops
    module Catzetka
      class Shop < Shops::Shop
        private

        def url
          'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml'
        end

        def mapper
          Catzetka::Mapper
        end

        def raw_data
           raw_data = strategy.parse(transport.fetch(url))
           raise Error::ResponseParserError if raw_data.blank? || raw_data[:cats]&.fetch(:cat, nil).blank?
           raw_data[:cats][:cat]
        end
      end
    end
  end
end
