module CatsPrice
  module Shops
    module Catshevshe
      class Shop < Shops::Shop
        private

        def mapper
          Catshevshe::Mapper
        end

        def url
          'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json'
        end

        def raw_data
          @raw_data ||= strategy.parse(transport.fetch(url))
        end
      end
    end
  end
end
