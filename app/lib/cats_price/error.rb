module CatsPrice
  class Error < StandardError
    class ShopApiError         < Error; end
    class ResponseParserError  < Error; end
  end
end
