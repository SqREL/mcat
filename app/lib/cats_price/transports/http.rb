module CatsPrice
  module Transports
    module Http
      module_function

      def fetch(url)
        response = RestClient.get(url)
        response.body
      rescue RestClient::Exception, RestClient::ExceptionWithResponse
        # Notification like sentry or whatever here
        # Probably log
        raise Error::ShopApiError
      end
    end
  end
end
