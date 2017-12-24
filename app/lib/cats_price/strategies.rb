module CatsPrice
  module Strategies
    module_function

    def strategy(key)
      {
        json: Strategies::Json
      }.fetch(key.to_sym)
    end
  end
end
