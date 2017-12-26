module CatsPrice
  module Strategies
    module_function

    def strategy(key)
      {
        json: Strategies::Json,
        xml:  Strategies::Xml
      }.fetch(key.to_sym)
    end
  end
end
