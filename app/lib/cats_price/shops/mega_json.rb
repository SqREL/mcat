module CatsPrice
  module Shops
    class MegaJson
      def strategy
        :json
      end

      def data
        response = RestClient.get('https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json')
        response.body
      end
    end
  end
end
