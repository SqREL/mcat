module CatsPrice
  module Transports
    module Http
      module_function

      def fetch(url)
        response = RestClient.get(url)
        response.body
      end

    end
  end
end
