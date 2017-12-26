module CatsPrice
  module Shops
    class Strategy
      class << self
        def to_sym
          strategy
        end

        def to_s
          strategy.to_s
        end

        def strategy
          raise NotImplementedError
        end
      end
    end
  end
end
